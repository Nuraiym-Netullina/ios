//
//  ViewController.swift
//  SectionTableView
//
//  Created by Arman Myrzakanurov on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let dict: [String: [String]] = [
        "Fruits": ["Apple", "Orange", "Banana"],
        "Vegitables": ["Tomato", "Potato", "Onion"],
        "Berries": ["Strawberry", "Blueberry", "Cherry"],
        "Breads": ["Cruassan", "Bagget", "AksaiNan"]
    ]
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(dict.keys)[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dict.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(dict.keys)[section]
        return dict[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let key = Array(dict.keys)[indexPath.section]
        let goods = dict[key]!
        content.text = goods[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}
