//
//  GameViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit
import AVFoundation
import AudioToolbox

class GameViewController: UIViewController {
    
    var soundManager = SoundManager()
   
    var some = ActionList()
    var word = ""
    var choiceActionAnswer = ""
    var choiceAction = ActionEnum.one
    
    var calculationScore = ScoreCalculation()
    var timer = Timer()
    var secondsRemaining = 3
    var questionBrain: WordsBrain?
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var actionQuestionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var wrongButton: UIButton!
    @IBOutlet var nextRoundButton: UIButton!
    
    @IBOutlet var buttonActionCollection: [UIButton]!
    
    var circularProgressBarView: CircularProgressBar!
    var circularViewDuration: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        questionBrain = WordsBrain(action: choiceAction)
        
    }
    
    // MARK: - ScoreCalculations
    
    
    //    func totalScoreForEachTeam() -> Int {
    //    Для передачи счета по MVC
    //    }
    
    private func setupViews() {
        actionLabel.isHidden = true
        changeHidden(bool: true)
        timerLabel.isHidden = true
        wordLabel.isHidden = true
        timerLabel.text = String(secondsRemaining)
        navigationItem.title = "Alfa"
        navigationItem.hidesBackButton = true
        nextRoundButton.isHidden = true
        rightButton.isHidden = true
        wrongButton.isHidden = true
        
    }
    
    private func changeHidden(bool: Bool) {
        actionQuestionLabel.isHidden = bool
        for button in buttonActionCollection {
            button.isHidden = bool
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "Отгадали" {
            updateWordsSet()
            print(calculationScore.addUpScore())
            soundManager.playSound(soundName: "right")
        } else {
            // реализовать +3 очка
            rightButton.setTitle("Отгадали", for: .normal)
            rightButton.isHidden = true
            wrongButton.isHidden = true
        }
        
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "Не отгадали" {
            print(#function)
            updateWordsSet()
            soundManager.playSound(soundName: "wrong")
        } else {
            // реализовать -3 очка
            wrongButton.setTitle("Не отгадали", for: .normal)
            rightButton.isHidden = true
            wrongButton.isHidden = true
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        // Надо скрыть кнопку сброса после смены команды,и почему вообще на кнопку сброса это должно происходить..
        soundManager.playSound(soundName: "button")
        
        if choiceActionAnswer == "Да" {
            print("Да")
            print(calculationScore.actionAddUpScore())
        } else if choiceActionAnswer == "Нет" {
            print("Нет")
            print(calculationScore.substractAction())
        }
        
        performSegue(withIdentifier: "goToScore", sender: self)
        
        //        guard startButton.currentTitle == "Начали" else {
        //            performSegue(withIdentifier: "goToScore", sender: self)
        //            return
        //        }
    }
    
    @IBAction func actionChanged(_ sender: UIButton) {
        for button in buttonActionCollection {
            button.isSelected = false
        }
        
        sender.isSelected = true
        choiceActionAnswer = sender.currentTitle ?? ""
        soundManager.playSound(soundName: "button")
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        timerLabel.isHidden = false
        wordLabel.isHidden = false
        
        if sender.currentTitle == "Начали"{
            createTimer()
           
            
        } else if sender.currentTitle == "Следующий раунд" {
            
            startButton.isHidden = true
            rightButton.setTitle("Отгадали", for: .normal)
            wrongButton.setTitle("Не отгадали", for: .normal)
            createTimer()
        }
        

        rightButton.isHidden = false
        wrongButton.isHidden = false
            self.timerLabel.text = String(self.secondsRemaining)
        
        print(calculationScore.teamChanging())
        
        setupCircularProgressBarView()
        
        if choiceActionAnswer == "Да" {
            print("Да")
            print(calculationScore.actionAddUpScore())
        } else if choiceActionAnswer == "Нет" {
            print("Нет")
            print(calculationScore.substractAction())
        }
        
        if some.actions.isEmpty {
            actionLabel.isHidden = true
            
        } else {
            
            actionLabel.text = some.actions[Int.random(in: 0..<some.actions.count)]
            let randomNumberFromArray = Int.random(in: 0..<some.actions.count)
            
            if let indexOfAction = some.actions.firstIndex(of: actionLabel.text!) {
                print(randomNumberFromArray)
                print(indexOfAction)
                print(some.actions.count)
                
                some.actions.remove(at: indexOfAction)
                
                if randomNumberFromArray == indexOfAction {
                    actionLabel.isHidden = false
                    
                } else {
                    actionLabel.isHidden = true
                }
            }
            
            updateWordsSet()
        }
     
        
        startButton.isHidden = true
        //        changeHidden(bool: true)
        soundManager.playSound(soundName: "button")
    }
    
    private func updateWordsSet() {
        word = questionBrain?.words.randomElement() ?? ""
        wordLabel.text = word
        questionBrain?.deleteElementFromWords(value: word)
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
            DispatchQueue.main.async {
                self.timerLabel.text = "Time's up!"
            }
            AudioServicesPlaySystemSound(SystemSoundID(1323))
            timer.invalidate()
            startButton.setTitle("Следующий раунд", for: .normal)
            startButton.isHidden = false
            
            secondsRemaining = 3
            
           
            
            
            if actionLabel.isHidden == false {
                changeHidden(bool: false)
            }
            
            nextRoundButton.isHidden = false
            
            // MARK: - Настройка кнопок команд
            
            
            rightButton.setTitle("Команда 1", for: .normal)
            wrongButton.setTitle("Команда 2", for: .normal)
            
        }
    }
}
//MARK: - Segue to Results

extension GameViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
    }
}

//MARK: - Circular ProgressBar

extension GameViewController {
    
    func setupCircularProgressBarView() {
        circularProgressBarView = CircularProgressBar(frame: .zero)
        circularProgressBarView.center = timerLabel.center
        circularProgressBarView.progressAnimation(duration: Double(secondsRemaining))
        view.addSubview(circularProgressBarView)
    }
}

