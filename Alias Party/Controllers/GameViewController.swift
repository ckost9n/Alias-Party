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

    @IBOutlet var timerLsbel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLsbel.text = String(secondsRemaining)
        createTimer()
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func wrongButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
    
    
}

extension GameViewController {
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        
        DispatchQueue.main.async {
            self.timerLsbel.text = String(self.secondsRemaining)
        }
        
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            timerLsbel.text = String(secondsRemaining)
        } else {
//            go to VC -> ResultViewController
//            dont have storyboard ID
        }
        
        
    }

}
