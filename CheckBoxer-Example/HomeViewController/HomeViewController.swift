//
//  HomeViewController.swift
//  CheckBoxer-Example
//
//  Created by Sparkout on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var checkBox: CheckBoxer!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBox.isCheckBox = false
        checkBox.selectedIcon = #imageLiteral(resourceName: "radiobutton_selected")
        checkBox.unselectedIcon = #imageLiteral(resourceName: "radiobutton_unselected")
        checkBox.allItems = [.init(title: "Apple", isSelected: true),
                             .init(title: "Android", isSelected: false),
                             .init(title: "BB", isSelected: false)]
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        print(checkBox.selectedItems)
    }
    
}

