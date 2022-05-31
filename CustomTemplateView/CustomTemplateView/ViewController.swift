//
//  ViewController.swift
//  CustomTemplateView
//
//  Created by Arman Myrzakanurov on 14.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    
    let movies: [MovieModel] = [
        MovieModel(title: "Batman", image: .remove),
        MovieModel(title: "Doctor Strange", image: .checkmark),
        MovieModel(title: "Avangers", image: .add),
        MovieModel(title: "Spider-Man", image: .remove),
        MovieModel(title: "Iron Man", image: .actions),
        MovieModel(title: "Cat Woman", image: .strokedCheckmark)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovies()
    }
    
    private func configureMovies() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for movie in movies {
            let movieView = MovieView()
            movieView.configure(with: movie)
            stackView.addArrangedSubview(movieView)
            stackView.layoutSubviews()
        }
        stackView.layoutIfNeeded()
        
    }
}

