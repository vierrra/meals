//
//  MealsTableViewController.swift
//  meals
//
//  Created by Renato on 5/15/21.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate  {
    
    var meals = [Meal(nameMeal: "Pizza", happiness: 5),
                 Meal(nameMeal: "Macarao", happiness: 4),
                 Meal(nameMeal: "Sopa", happiness: 2)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell      = UITableViewCell(style: .default, reuseIdentifier: nil)
        let allMeals  = meals[indexPath.row]
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetailMeal(_ :)))
       
        cell.addGestureRecognizer(longPress)
        cell.textLabel?.text = allMeals.nameMeal
        
        return cell
    }
    
    @objc func showDetailMeal(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            
                if let indexPath = tableView.indexPath(for: cell) {
                    let meal = meals[indexPath.row]
                    
                    self.showAlertAction(meal, indexPath)
                }
        }
    }
    
    func showAlertAction(_ meal: Meal, _ indexPath: IndexPath) {
        
        let alert        = UIAlertController(title: "\(meal.nameMeal)", message: meal.details(), preferredStyle: .alert)
        let okButton     = UIAlertAction(title: "Ok", style: .default)
        let removeButton = UIAlertAction(title: "Remover", style: .destructive, handler: { alert in
            
            self.meals.remove(at: indexPath.row)
            self.tableView.reloadData()
        })
        
        alert.addAction(okButton)
        alert.addAction(removeButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func addMeal(_ meal: Meal) {
        meals.append(meal)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMeal" {
            if let viewController = segue.destination as? AddMealViewController {
                viewController.delegate = self
            }
        }
    }
}
