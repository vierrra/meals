//
//  AddMealViewController.swift
//  meals
//
//  Created by Renato on 5/14/21.
//

import UIKit

class AddMealViewController: UIViewController, AddItemsDelegate {

    //MARK: - IBOutlet
    
    @IBOutlet weak var nameMealTextField:  UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    @IBOutlet weak var itemsTableView:     UITableView!
    
    // MARK: - Attributes
    
    var delegate:       AddMealDelegate?
    var items:          [ItemsMeal] = [ItemsMeal("Molho de tomate", 100.0),
                                       ItemsMeal("Queijo", 120.0),
                                       ItemsMeal("Manjeiricão", 100.0)]
    var selectionItems: [ItemsMeal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTopBarButton()
    }
    
    func createTopBarButton () {
        let topBarButton = UIBarButtonItem(title: "Adicionar Item", style: .plain, target: self, action: #selector(actionToBarButton))
        
        navigationItem.rightBarButtonItem = topBarButton
    }
    
    @objc func actionToBarButton() {
        let viewController = AddItemsViewController(delegate: self)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - IBAction
    
    @IBAction func addMealButton(_ sender: Any) {
        guard let nameMealTextField = nameMealTextField?.text, let happinessTextField = Int((happinessTextField?.text)!)  else { return }
        
        let meal = Meal(nameMeal: nameMealTextField, happiness: happinessTextField, itemsMeal: selectionItems)
        
        delegate?.addMeal(meal)
        
        navigationController?.popViewController(animated: true)
    }
    
    func addItem(_ item: ItemsMeal) {
        items.append(item)
        itemsTableView.reloadData()
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
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.nameItemMeal
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectionItems.append(items[indexPath.row])
        } else {
            cell.accessoryType = .none
            
            let item = items[indexPath.row]
            
            if let positionItem = selectionItems.firstIndex(of: item) {
                selectionItems.remove(at: positionItem)
            }
        }
    }
}

