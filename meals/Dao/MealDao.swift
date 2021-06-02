//
//  MealDao.swift
//  meals
//
//  Created by Renato on 6/2/21.
//

import Foundation
import UIKit

class MealDao {
    
    func saveData(_ meals: [Meal]) {
        guard let way = recoveryDirectory() else { return }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            
                       try data.write(to: way)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recoveryData() -> [Meal] {
        guard let way = recoveryDirectory() else { return [] }
        
        do {
            let data = try Data(contentsOf: way)
            guard let mealSalved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Meal] else { return [] }
            
            return mealSalved
        } catch {
            print(error.localizedDescription)
            
            return []
        }
    }
    
    func recoveryDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let way  = directory.appendingPathComponent("meal")
        
        return way
    }
}
