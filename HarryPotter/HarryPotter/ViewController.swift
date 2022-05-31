//
//  ViewController.swift
//  HarryPotter
//
//  Created by Arman Myrzakanurov on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var houseName: UILabel!
    @IBOutlet private weak var animal: UILabel!
    @IBOutlet private weak var color: UILabel!
    @IBOutlet private weak var element: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
        networkManager.fetchHouses()
    }
}

// MARK: - NetworkManagerDelegate

extension ViewController: NetworkManagerDelegate {
    
    func onHouseDidUpdate(with model: HouseModel) {
        DispatchQueue.main.async {
            let colorsArray = model.houseColours.components(separatedBy: "and")
            print(colorsArray)
            self.houseName.text = model.name
            self.animal.text = model.animal
            self.color.text = model.houseColours
            self.element.text = model.element
            self.imageView.image = UIImage(named: model.animal)
        }
    }
}
