//
//  ChoiceViewController.swift
//  Alias Party
//
//  Created by Konstantin on 07.05.2022.
//

import UIKit

class ChoiceViewController: UIViewController {

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
        for button in buttonChoiceCollection {
            button.isSelected = false
        }
        
        sender.isSelected = true
        choiceAction = sender.currentTitle ?? ""
        print(choiceAction)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        switch choiceAction {
        case "Один": choiceActionEnum = .one
        case "Два": choiceActionEnum = .two
        case "Три": choiceActionEnum = .three
        case "Четыре": choiceActionEnum = .four
        default:
            choiceActionEnum = .one
        }
        
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


