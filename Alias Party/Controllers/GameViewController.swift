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
    var teamId = "TeamOne"
    var scoreTeamOne = 0
    var scoreTeamTwo = 0

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

    func addUpScore() {
        if teamId == "TeamOne" {
            scoreTeamOne += 1
            print("Счет первой команды: \(scoreTeamOne)")
        } else if teamId == "TeamTwo" {
            scoreTeamTwo += 1
            print("Счет второй команды: \(scoreTeamTwo)")
        } else {
            print("What`s happend")
        }
    }
    func actionAddUpScore() {
        if teamId == "TeamOne" {
            scoreTeamOne += 3
            print("Прибавка от действия первой команде")
        } else if teamId == "TeamTwo"{
            scoreTeamTwo += 3
            print("Прибавка от действия второй команде")
        } else{
            print("What`s happend in actionAddUpScore()")
        }
    }
    func substractAction() {
        if teamId == "TeamOne"{
            scoreTeamOne -= 1
            print("Отнятие 1 от счета первой команды")
        } else if teamId == "TeamTwo"{
            scoreTeamTwo -= 1
            print("Отнятие 1 от счета второй команды")
        } else{
            print("What`s happend in substractAction()")
        }
    }
    func teamChanging() {
        if teamId == "TeamOne" {
            teamId = "TeamTwo"
        } else{
            teamId = "TeamOne"
        }
    }

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
        world = questionBrain.question2.randomElement() ?? ""
        wordLabel.text = world
        questionBrain.deleteElementFromArray2(value: world)
        addUpScore()
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        world = questionBrain.question2.randomElement() ?? ""
        wordLabel.text = world
        questionBrain.deleteElementFromArray2(value: world)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        teamChanging()
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
            actionAddUpScore()
        } else if choiceAction == "Нет" {
            print("Нет")
            substractAction()
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
            
//            wordLabel.text = questionBrain.question[0].text
//            questionBrain.deleteElementFromArray()
            
            world = questionBrain.question2.randomElement() ?? ""
            wordLabel.text = world
            questionBrain.deleteElementFromArray2(value: world)
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startButton.isHidden = true
//        changeHidden(bool: true)
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


