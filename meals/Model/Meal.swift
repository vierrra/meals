//
//  Meal.swift
//  meals
//
//  Created by Renato on 5/15/21.
//

import UIKit

class Meal {
    let nameMeal:  String
    let happiness: Int
    let itemsMeal: [ItemsMeal] = []
    
    // MARK: - Constructor
    
    init(nameMeal: String, happiness: Int) {
        self.nameMeal  = nameMeal
        self.happiness = happiness
    }
    
    //MARK: - Method
    
    func totalCalories() -> Double {
        var totalCalories = 0.0
        
        for calories in itemsMeal {
            totalCalories += calories.calories
        }
        
        return totalCalories
    }
}
