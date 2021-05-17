//
//  MealsTableViewController.swift
//  meals
//
//  Created by Renato on 5/15/21.
//

import UIKit

class MealsTableViewController: UITableViewController  {
    
    var meals = [Meal(nameMeal: "Pizza", happiness: 5),
                 Meal(nameMeal: "Macarao", happiness: 4),
                 Meal(nameMeal: "Sopa", happiness: 2)]
    
    func addMeal(_ meal: Meal) {
        meals.append(meal)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddMealViewController {
            viewController.mealsTableViewController = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let allMeals = meals[indexPath.row]
        
        cell.textLabel?.text = allMeals.nameMeal
        
        return cell
    }
}
