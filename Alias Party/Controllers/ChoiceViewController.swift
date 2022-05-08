//
//  ChoiceViewController.swift
//  Alias Party
//
//  Created by Konstantin on 07.05.2022.
//

import UIKit

class ChoiceViewController: UIViewController {
    var soundManager = SoundManager()
    
    @IBOutlet var buttonChoiceCollection: [UIButton]!
    
    private var choiceAction = ""
    private var choiceActionEnum = ActionEnum.one
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    private func setupViews() {
        
        for (index, button) in buttonChoiceCollection.enumerated() {
            switch index {
            case 0: button.setTitle(ActionEnum.one.rawValue, for: .normal)
            case 1: button.setTitle(ActionEnum.two.rawValue, for: .normal)
            case 2: button.setTitle(ActionEnum.three.rawValue, for: .normal)
            case 3: button.setTitle(ActionEnum.four.rawValue, for: .normal)
            default:
                button.setTitle("Один", for: .normal)
            }
            
        }
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
 
        choiceAction = sender.currentTitle ?? ""
        switch choiceAction {
        case ActionEnum.one.rawValue: choiceActionEnum = .one
        case ActionEnum.two.rawValue: choiceActionEnum = .two
        case ActionEnum.three.rawValue: choiceActionEnum = .three
        case ActionEnum.four.rawValue: choiceActionEnum = .four
        default:
            choiceActionEnum = .one
        }
        print(choiceAction)
        performSegue(withIdentifier: "goToGameVC", sender: self)
    }
    
}

//MARK: - Segue to Results

extension ChoiceViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? GameViewController else { return }
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .flipHorizontal
        gameVC.choiceAction = choiceActionEnum
    }
}


