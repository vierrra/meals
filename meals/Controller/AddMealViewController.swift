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
    
    var delegate: AddMealViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMealButton(_ sender: Any) {
        guard let nameMealTextField = nameMealTextField?.text, let happinessTextField = Int((happinessTextField?.text)!)  else { return }
        
        let meal = Meal(nameMeal: nameMealTextField, happiness: happinessTextField)
        
        print("Comi \(meal.nameMeal) e tive felicidade: \(meal.happiness)")
        
        delegate?.addMeal(meal)
        
        navigationController?.popViewController(animated: true)
    }
}

protocol AddMealViewControllerDelegate {
    func addMeal(_ meal: Meal) 
}

