//
//  GameViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var some = ActionList()
    var world = ""
    var choiceAction = ""
    var calculationScore = ScoreCalculation()
    var timer = Timer()
    var secondsRemaining = 10
    var questionBrain = questionsBrain()
   
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var buttonActionCollection: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    // MARK: - ScoreCalculations


//    func totalScoreForEachTeam() -> Int {
//    Для передачи счета по MVC
//    }
    
    private func setupViews() {
        actionLabel.isHidden = true
        changeHidden(bool: true)
        timerLabel.text = String(secondsRemaining)
        navigationItem.title = "Alfa"
    }
    
    private func changeHidden(bool: Bool) {
        for button in buttonActionCollection {
            button.isHidden = bool
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        updateWordsSet()
        print("---------")
        print(calculationScore.addUpScore())
        print("---------")
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        updateWordsSet()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print(calculationScore.teamChanging())
        // Надо скрыть кнопку сброса после смены команды,и почему вообще на кнопку сброса это должно происходить..
    }
    
    @IBAction func actionChanged(_ sender: UIButton) {
        for button in buttonActionCollection {
            button.isSelected = false
        }
        
        sender.isSelected = true
        choiceAction = sender.currentTitle ?? ""
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        
        if choiceAction == "Да" {
            print("Да")
            print(calculationScore.actionAddUpScore())
        } else if choiceAction == "Нет" {
            print("Нет")
            print(calculationScore.substractAction())
        }
        
        guard startButton.currentTitle == "Начали" else {
            performSegue(withIdentifier: "goToScore", sender: self)
            return
        }
        
        if some.actions.isEmpty {
            actionLabel.isHidden = true
            
        } else {
            
            actionLabel.text = some.actions[Int.random(in: 0..<some.actions.count)]
            let startButtonPressedCount = Int.random(in: 0..<some.actions.count)
            
            if let indexOfAction = some.actions.firstIndex(of: actionLabel.text!) {
                print(startButtonPressedCount)
                print(indexOfAction)
                print(some.actions.count)
                
                some.actions.remove(at: indexOfAction)
                
                if startButtonPressedCount == indexOfAction {
                    actionLabel.isHidden = false
                    
                } else {
                    actionLabel.isHidden = true
                    
                }
            }
            
            updateWordsSet()
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startButton.isHidden = true
//        changeHidden(bool: true)
    }
    
    private func updateWordsSet() {
        world = questionBrain.question2.randomElement() ?? ""
        wordLabel.text = world
        questionBrain.deleteElementFromArray2(value: world)
    }
}

// MARK: - Timer

extension GameViewController {
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }   

    @objc func updateTimer() {
        
        DispatchQueue.main.async {
            self.timerLabel.text = String(self.secondsRemaining)
        }
        
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            timerLabel.text = String(secondsRemaining)
        } else if secondsRemaining == 0 {
            timer.invalidate()
            startButton.setTitle("Дальше", for: .normal)
            startButton.isHidden = false
            if actionLabel.isHidden == false {
                changeHidden(bool: false)
            }
            
            
        }
        
    }
}

extension GameViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
    }
}


