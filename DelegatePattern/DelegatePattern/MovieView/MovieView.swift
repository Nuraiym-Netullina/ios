//
//  MovieView.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import UIKit

protocol MovieViewDelegate: AnyObject {
    func onButtonDidTap()
}

class MovieView: UIView {
    
    weak var delegate: MovieViewDelegate?
    
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    func configure(with text: String, image: UIImage) {
        movieTitle.text = text
        movieImage.image = image
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        print("Button tapped in MovieView")
        delegate?.onButtonDidTap()
    }
    
    func loadNib() {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        addSubview(nibView)
        
        nibView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nibView.topAnchor.constraint(equalTo: topAnchor),
            nibView.leftAnchor.constraint(equalTo: leftAnchor),
            nibView.rightAnchor.constraint(equalTo: rightAnchor),
            nibView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
