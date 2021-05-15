//
//  AddMealViewController.swift
//  meals
//
//  Created by Renato on 5/14/21.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var nameMealTextField:  UITextField!
    @IBOutlet weak var happinessTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMealButton(_ sender: Any) {
        guard let nameMealTextField = nameMealTextField.text, let happinessTextField = happinessTextField.text  else { return }
        
        print("Comi \(nameMealTextField) e tive felicidade: \(happinessTextField)")
    }
}

