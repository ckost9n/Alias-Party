//
//  GameViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var soundManager = SoundManager()
    var some = ActionList()
    
    
    
    var timer = Timer()
    var secondsRemaining = 60

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        actionLabel.isHidden = true
        
        timerLabel.text = String(secondsRemaining)
        
        
    }
    
    private func setupViews() {
        wordLabel.numberOfLines = 0
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        soundManager.playSound(soundName: "right")
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
        soundManager.playSound(soundName: "wrong")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        soundManager.playSound(soundName: "button")
        
    }
    
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        
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
        }
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startButton.alpha = 0
        
        soundManager.playSound(soundName: "button")
    }
}



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
        } else {
            soundManager.playSound(soundName: "endTimer1")
            timer.invalidate()
            //            go to VC -> ResultViewController
            //            dont have storyboard ID
            //            comment

        }
    }
}
