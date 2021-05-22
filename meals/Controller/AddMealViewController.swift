//
//  AddMealViewController.swift
//  meals
//
//  Created by Renato on 5/14/21.
//

import UIKit

class AddMealViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var nameMealTextField:  UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    
    // MARK: - Attributes
    
    var delegate: AddMealDelegate?
    
    let items = ["Mollho de tomate", "Majericão"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    @IBAction func addMealButton(_ sender: Any) {
        guard let nameMealTextField = nameMealTextField?.text, let happinessTextField = Int((happinessTextField?.text)!)  else { return }
        
        let meal = Meal(nameMeal: nameMealTextField, happiness: happinessTextField)
        
        print("Comi \(meal.nameMeal) e tive felicidade: \(meal.happiness)")
        
        delegate?.addMeal(meal)
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Protocols

protocol AddMealDelegate {
    func addMeal(_ meal: Meal) 
}

//MARK: - Extension

extension AddMealViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

