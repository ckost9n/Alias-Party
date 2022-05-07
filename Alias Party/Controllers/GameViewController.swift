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
    var secondsRemaining = 2
    var questionBrain: WordsBrain?
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var actionQuestionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var wrongButton: UIButton!
    @IBOutlet var teamOneButton: UIButton!
    @IBOutlet var teamTwoButton: UIButton!
    
    @IBOutlet var buttonActionCollection: [UIButton]!
    
    var circularProgressBarView: CircularProgressBar!
    var circularViewDuration: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        questionBrain = WordsBrain(action: choiceAction)
        navigationItem.hidesBackButton = true
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
        
        teamOneButton.isHidden = true
        teamTwoButton.isHidden = true
//        rightButton.isHidden = false
//        wrongButton.isHidden = false
    }
    
    private func changeHiddenTeam() {
        rightButton.isHidden.toggle()
        wrongButton.isHidden.toggle()
        teamOneButton.isHidden.toggle()
        teamTwoButton.isHidden.toggle()
    }
    
    private func changeHidden(bool: Bool) {
        actionQuestionLabel.isHidden = bool
        for button in buttonActionCollection {
            button.isHidden = bool
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        updateWordsSet()
        print("---------")
        print(calculationScore.addUpScore())
        print("---------")
        soundManager.playSound(soundName: "right")
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        updateWordsSet()
        soundManager.playSound(soundName: "wrong")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print(calculationScore.teamChanging())
        // Надо скрыть кнопку сброса после смены команды,и почему вообще на кнопку сброса это должно происходить..
        soundManager.playSound(soundName: "button")
    }
    
    @IBAction func actionChanged(_ sender: UIButton) {
        for button in buttonActionCollection {
            button.isSelected = false
        }
        
        sender.isSelected = true
        choiceActionAnswer = sender.currentTitle ?? ""
        soundManager.playSound(soundName: "button")
    }
    
    @IBAction func teamOneButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func teamTwoButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        
        setupCircularProgressBarView()
        
        if choiceActionAnswer == "Да" {
            print("Да")
            print(calculationScore.actionAddUpScore())
        } else if choiceActionAnswer == "Нет" {
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
            AudioServicesPlaySystemSound(SystemSoundID(1323))
            timer.invalidate()
            startButton.setTitle("Дальше", for: .normal)
            startButton.isHidden = false
           
            if actionLabel.isHidden == false {
                changeHidden(bool: false)
            }
            changeHiddenTeam()
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

