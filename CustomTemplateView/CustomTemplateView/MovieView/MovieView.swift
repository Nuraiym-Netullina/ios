//
//  MovieView.swift
//  CustomTemplateView
//
//  Created by Arman Myrzakanurov on 14.05.2022.
//

import UIKit

class MovieView: NibView {
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    override func configure() {
        contentView.backgroundColor = .cyan
    }
    
    func configure(with model: MovieModel) {
        movieTitle.text = model.title
        movieImage.image = model.image
    }
}
