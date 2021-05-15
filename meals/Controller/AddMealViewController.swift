//
//  AddMealViewController.swift
//  meals
//
//  Created by Renato on 5/14/21.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var nameMealTextField:  UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMealButton(_ sender: Any) {
        guard let nameMealTextField = nameMealTextField?.text, let happinessTextField = Int((happinessTextField?.text)!)  else { return }
        
        let meal = Meal(nameMeal: nameMealTextField, happiness: happinessTextField)
        
        print("Comi \(meal.nameMeal) e tive felicidade: \(meal.happiness)")
    }
}

