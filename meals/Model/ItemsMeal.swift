//
//  ItemsMeal.swift
//  meals
//
//  Created by Renato on 5/15/21.
//

import UIKit

class ItemsMeal: Equatable {

    let nameItemMeal: String
    let calories:     Double
    
    init(_ nameItemMeal: String, _ calories: Double) {
        self.nameItemMeal = nameItemMeal
        self.calories     = calories
    }
    
    static func == (lhs: ItemsMeal, rhs: ItemsMeal) -> Bool {
        return lhs.nameItemMeal == rhs.nameItemMeal && lhs.calories == rhs.calories
    }
}

