//
//  GameViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var timer = Timer()
    var secondsRemaining = 10
    var questionBrain = questionsBrain()
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = String(secondsRemaining)
        createTimer()
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        wordLabel.text = questionBrain.question[0].text
        questionBrain.deleteElementFromArray()
        
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        // replace.array
    }
    
    
    @IBAction func startButtonAction(_ sender: UIButton) {
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
//            go to VC -> ResultViewController
//            dont have storyboard ID
//            comment
        }
        
        
    }
}
