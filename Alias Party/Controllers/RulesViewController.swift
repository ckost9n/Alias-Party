//
//  RulesViewController.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    let rules = RulesData()

    @IBOutlet weak var rulesLabel: UITextView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        rulesLabel.text = rules.getRules()
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
