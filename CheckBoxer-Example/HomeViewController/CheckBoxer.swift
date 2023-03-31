//
//  CheckBoxer.swift
//  CheckBoxer-Example
//
//  Created by Sparkout on 31/03/23.
//

import UIKit

struct CheckBoxItem {
    let title: String
    var isSelected: Bool
}

class CheckBoxer: UIView {
    private lazy var tableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    var allItems: [CheckBoxItem]! {
        didSet {
            selectedItems = allItems.filter(\.isSelected)
        }
    }
    var selectedItems: [CheckBoxItem] = []
    var isCheckBox: Bool = true
    
    var selectedIcon: UIImage?
    var unselectedIcon: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.separatorStyle = .none
    }
    
    private func configureView() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension CheckBoxer: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let item = allItems[indexPath.row]
        if #available(iOS 14.0, *) {
            var config = cell.defaultContentConfiguration()
            config.image = item.isSelected ? selectedIcon : unselectedIcon
            config.text = item.title
            cell.contentConfiguration = config
        } else {
            cell.imageView?.image = item.isSelected ? selectedIcon : unselectedIcon
            cell.textLabel?.text = item.title
        }
        return cell
    }
}

extension CheckBoxer: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / CGFloat(allItems.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isCheckBox {
            var selectedItem = allItems[indexPath.row]
            selectedItem.isSelected.toggle()
            allItems[indexPath.row] = selectedItem
        } else {
            allItems.enumerated().forEach { index, item in
                let selected: Bool = indexPath.row == index
                allItems[index].isSelected = selected
            }
        }
        tableView.reloadData()
    }
}
