//
//  ResultViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit

class ResultViewController: UIViewController, JokeManagerDelegate {
    
    var jokeManager = JokeManager()

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
                
            }
            
        }
    }
  
}
