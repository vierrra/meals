//
//  ItemsDao.swift
//  meals
//
//  Created by Renato on 6/2/21.
//

import Foundation
import UIKit

class ItemsDao {
    
    func saveData(_ items: [ItemsMeal]) {
        guard let way = recoveryDirectory() else { return }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            
                       try data.write(to: way)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recoveryData() -> [ItemsMeal] {
        guard let way = recoveryDirectory() else { return [] }

        do {
            let data = try Data(contentsOf: way)
            guard let itemsSalved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [ItemsMeal] else { return [] }

            return itemsSalved
        } catch {
            print(error.localizedDescription)
            
            return []
        }
    }
    
    func recoveryDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let way  = directory.appendingPathComponent("items")
        
        return way
    }
}
