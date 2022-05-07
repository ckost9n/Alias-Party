//
//  ResultViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController, JokeManagerDelegate {
    
    var soundManager = SoundManager()
    
    var jokeManager = JokeManager()
    

    @IBOutlet var checkLabel: UILabel!
    @IBOutlet var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    private func setupViews() {
        jokeManager.delegate = self
        jokeManager.getJoke()
        navigationItem.title = "Alfa"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        soundManager.playSound(soundName: "button")
        
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        soundManager.playSound(soundName: "button")
        
    }
    
    @IBAction func goMainViewButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        soundManager.playSound(soundName: "button")
    }
    
    func didUpdateJoke(joke: JokeModel, punchline: JokeModel) {
        
        DispatchQueue.main.async {
        
            self.jokeLabel.text = joke.setup
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                
                self.jokeLabel.text! += "\n" + punchline.punchline
                self.soundManager.playSound(soundName: "jokeDrum1")
                
            }
            
        }
    }
}
