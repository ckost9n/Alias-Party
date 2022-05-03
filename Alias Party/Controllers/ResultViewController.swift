//
//  ResultViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController, JokeManagerDelegate {
    
    var jokeManager = JokeManager()
    var player: AVAudioPlayer!

    @IBOutlet var checkLabel: UILabel!
    @IBOutlet var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jokeManager.delegate = self
        jokeManager.getJoke()
        
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func goMainViewButtonPressed(_ sender: Any) {
    }
    
    func didUpdateJoke(joke: JokeModel, punchline: JokeModel) {
        
      
        
        DispatchQueue.main.async {
        
            self.jokeLabel.text = joke.setup
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                
                self.jokeLabel.text! += "\n" + punchline.punchline
                self.playSound()
                
            }
            
        }
    }
  
    func playSound() {
        let url = Bundle.main.url(forResource: "jokeDrum", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
