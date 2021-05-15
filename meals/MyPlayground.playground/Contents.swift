import UIKit

class Meal {
    let nameMeal:  String
    let happiness: String
    var itemsMeal: [ItemsMeal] = []
    
    // MARK - Constructor
    
    init(nameMeal: String, happiness: String) {
        self.nameMeal  = nameMeal
        self.happiness = happiness
    }
    
    //MARK - Method
    
    func totalCalories() -> Double {
        var totalCalories = 0.0
        
        for calories in itemsMeal {
            totalCalories += calories.calories
        }
        
        return totalCalories
    }
}

class ItemsMeal {
    let nameItemMeal: String
    let calories:     Double
    
    init(_ nameItemMeal: String, _ calories: Double) {
        self.nameItemMeal = nameItemMeal
        self.calories     = calories
    }
}

let arroz  = ItemsMeal("Arroz", 51)
let feijao = ItemsMeal("Feijão", 90)
let file   = ItemsMeal("File", 287)

let meal = Meal(nameMeal: "Filé Grelhado", happiness: "5")
meal.itemsMeal.append(arroz)
meal.itemsMeal.append(feijao)
meal.itemsMeal.append(file)

print(meal.totalCalories())



