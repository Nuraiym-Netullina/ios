//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import UIKit

class ViewController: UIViewController, MovieViewDelegate {
    
    let movies: [String] = []
    
    @IBOutlet private weak var movieView: MovieView!
    @IBOutlet private weak var secondMoviewView: MovieView!
    
    private var selectedID: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        movieView.configure(with: "Batman", image: .strokedCheckmark, id: 0)
        secondMoviewView.configure(with: "Iron Man", image: .remove, id: 1)
        movieView.delegate = self
        secondMoviewView.delegate = self
    }
    
    func onButtonDidTap(with id: Int) {
        print("Selected ID: \(id)")
        print("Button Tapped in ViewController")
        selectedID = id
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ResultViewController
        destVC.navigationTitleText = movies[selectedID]
    }
}
