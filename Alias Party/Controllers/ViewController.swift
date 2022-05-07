//
//  ViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundManager = SoundManager()
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isHidden = true
    }

    @IBAction func continuePressed(_ sender: UIButton) {
        print(#function)
        soundManager.playSound(soundName: "button")
        
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        print(#function)
        soundManager.playSound(soundName: "button")
    }
    
    @IBAction func rulesPressed(_ sender: UIButton) {
        print(#function)
        soundManager.playSound(soundName: "button")
    }
    
    
}


