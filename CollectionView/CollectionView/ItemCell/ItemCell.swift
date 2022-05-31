//
//  ItemCell.swift
//  CollectionView
//
//  Created by Arman Myrzakanurov on 17.04.2022.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with number: String) {
        numberLabel.text = number
    }
}
