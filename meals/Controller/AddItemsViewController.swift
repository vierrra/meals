//
//  AddItemsViewController.swift
//  meals
//
//  Created by Renato on 5/31/21.
//

import UIKit

class AddItemsViewController: UIViewController {
    
    @IBOutlet weak var itemTextField:     UITextField?
    @IBOutlet weak var caloriesTextField: UITextField?
    
    var delegate: AddItemsDelegate?
    
    init(delegate: AddItemsDelegate) {
        super.init(nibName: "AddItemsViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddItemButton(_ sender: Any) {
        guard let itemTextField = itemTextField?.text, let caloriesTextField = Double((caloriesTextField?.text)!) else { return }
        
        let item = ItemsMeal(itemTextField, caloriesTextField)
        
        guard let delegate = delegate else { return }
        delegate.addItem(item)
        
        navigationController?.popViewController(animated: true)
    }
}

protocol AddItemsDelegate {
    func addItem(_ item: ItemsMeal)
}
