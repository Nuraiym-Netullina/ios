//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import UIKit

class ViewController: UIViewController, MovieViewDelegate {
    
    @IBOutlet private weak var movieView: MovieView!

    override func viewDidLoad() {
        super.viewDidLoad()
        movieView.configure(with: "Batman", image: .strokedCheckmark)
        movieView.delegate = self
    }
    
    func onButtonDidTap() {
        print("Button Tapped in ViewController")
        performSegue(withIdentifier: "showResult", sender: self)
    }
}
