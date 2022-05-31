//
//  NibView.swift
//  CustomTemplateView
//
//  Created by Arman Myrzakanurov on 14.05.2022.
//

import UIKit

class NibView: UIView {
    
    var contentView: UIView {
        return subviews.first!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configure()
    }
    
    func configure() {}
    
    private func loadNib() {
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
