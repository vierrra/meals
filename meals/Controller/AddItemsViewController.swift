//
//  AddItemsViewController.swift
//  meals
//
//  Created by Renato on 5/31/21.
//

import UIKit

class AddItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddItemButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
