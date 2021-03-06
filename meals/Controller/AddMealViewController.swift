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
    @IBOutlet weak var itemsTableView:     UITableView?
    
    // MARK: - Attributes

    var items: [ItemsMeal] = []
    
    var selectionItems: [ItemsMeal] = []
    var delegate:       AddMealDelegate?
    
    
    override func viewDidLoad() {
        
        self.createTopBarButton()
        
        items = ItemsDao().recoveryData()
    }
    
    //MARK: -  Methods
    
    func createTopBarButton () {
        let topBarButton = UIBarButtonItem(title: "Adicionar Item", style: .plain, target: self, action: #selector(actionToBarButton))
        
        navigationItem.rightBarButtonItem = topBarButton
    }
    
    @objc func actionToBarButton() {
        let viewController = AddItemsViewController(delegate: self)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func addItem(_ item: ItemsMeal) {
        items.append(item)
         
        if let itemsTableView = itemsTableView {
            itemsTableView.reloadData()
        } else {
            Alert(controller: self).showAlertAction(title: "Atenção", message: "Não foi possível adicionar o item na lista")
        }
        
        ItemsDao().saveData(items)
    }
    
    func recoveryMealForm() -> Meal? {
        guard let nameMealTextField = nameMealTextField?.text, let happinessTextField = Int((happinessTextField?.text)!) else { return nil }
        
        let meal = Meal(nameMeal: nameMealTextField, happiness: happinessTextField, itemsMeal: selectionItems)
        
        return meal
    }

    //MARK: - IBAction
    
    @IBAction func addMealButton(_ sender: Any) {
        
        guard let delegate = delegate, let meal = recoveryMealForm() else { return }
        delegate.addMeal(meal)
        
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
            if let positionItem = selectionItems.firstIndex(of: items[indexPath.row]) {
                    selectionItems.remove(at: positionItem)
            }
        }
    }
}

