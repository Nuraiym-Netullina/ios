//
//  ViewController.swift
//  HarryPotterRandomizer
//
//  Created by Nuraiym Netullina on 22.05.2022.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    var manager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
//        manager.fetchHouses()
        manager.fetchAlamofireHouses()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        
    }
    
    func onHouseModelDidUpdate(with model: HouseModel) {
        self.label1.text = model.name
        self.label2.text = model.animal
        self.label3.text = model.houseColours
        self.label4.text = model.element
    }
}
