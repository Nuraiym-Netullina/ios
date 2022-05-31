//
//  MovieView.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import UIKit

protocol MovieViewDelegate: AnyObject {
    func onButtonDidTap(with id: Int)
}

class MovieView: NibView {
    
    weak var delegate: MovieViewDelegate?
    
    private var id: Int = -1
    
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    func configure(with text: String, image: UIImage, id: Int) {
        self.id = id
        movieTitle.text = text
        movieImage.image = image
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        print("Button tapped in MovieView")
        delegate?.onButtonDidTap(with: id)
    }
}
