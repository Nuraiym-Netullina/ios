//
//  ViewController.swift
//  Totemizer
//
//  Created by Nuraiym Netullina on 02.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTap(_ sender: UIButton) {
        //animalImage.image = animals[Int.random(in: 0...5)]
        let animal = animals.randomElement()
        animalImage.image = animal?.value
        animalName.text = animal?.key
        
        //animalImage.image = animals.randomElement()
    }
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    let animals: [String : UIImage] = [
        "Wolf": #imageLiteral(resourceName: "wolf"),
        "Tiger": #imageLiteral(resourceName: "tiger"),
        "Lion": #imageLiteral(resourceName: "lion"),
        "Fox": #imageLiteral(resourceName: "fox"),
        "Cat": #imageLiteral(resourceName: "cat"),
        "Owl": #imageLiteral(resourceName: "owl")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //animalImage.image = #imageLiteral(resourceName: "fox") // #imageLiterla()
        animalName.text = "Hello world!"
            //animalImage.image = UIImage(named: "wolf")
        rollButton.setTitle("Which animal?", for: .normal) //set title for button
        
        
    }
}

