//
//  ViewController.swift
//  Randomizer
//
//  Created by Nuraiym Netullina on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var author: UILabel!
    
    var motivations: [Motivation] = [
                                    .init(text: "We cannot solve problems with the kind of thinking we employed when we came up with them.", image: #imageLiteral(resourceName: "money"), author: "Albert Einstein"),
                                    .init(text: "It is better to fail in originality than to succeed in imitation.", image: #imageLiteral(resourceName: "team"), author: "Herman Melville"),
                                    .init(text: "Success usually comes to those who are too busy looking for it.", image: #imageLiteral(resourceName: "goal"), author: "Henry David Thoreau")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClick(_ sender: UIButton) {
        let index = motivations.randomElement()
        image.image = index?.image
        text.text = index?.text
        author.text = index?.author
    }
    

}

struct Motivation {
    var text: String
    var image: UIImage
    var author: String
    
    init(text: String, image: UIImage, author: String){
        self.image=image
        self.text=text
        self.author=author
    }
}

