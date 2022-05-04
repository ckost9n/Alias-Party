//
//  GameViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var some = ActionList()

    var timer = Timer()
    var secondsRemaining = 5

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    private func setupViews() {
        actionLabel.isHidden = true
        wordLabel.numberOfLines = 0
        actionLabel.numberOfLines = 0
        
        timerLabel.text = String(secondsRemaining)
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
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
            startButton.isHidden = false
            
        }
        
    }
}
