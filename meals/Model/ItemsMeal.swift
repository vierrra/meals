//
//  ItemsMeal.swift
//  meals
//
//  Created by Renato on 5/15/21.
//

import UIKit

class ItemsMeal: NSObject, NSCoding {
    let nameItemMeal: String
    let calories:     Double
    
    init(_ nameItemMeal: String, _ calories: Double) {
        self.nameItemMeal = nameItemMeal
        self.calories     = calories
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nameItemMeal, forKey: "nameItemMeal")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        nameItemMeal = coder.decodeObject(forKey: "nameItemMeal") as! String
        calories     = coder.decodeDouble(forKey: "calories")
    }
}

