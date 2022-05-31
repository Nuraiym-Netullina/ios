//
//  Films.swift
//  Films
//
//  Created by Nuraiym Netullina on 17.04.2022.
//

import UIKit

class Films: UICollectionViewCell {

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with image: UIImage, name: String, description: String) {
        filmName.text = name
        filmImage.image = image
        filmDescription.text = description
    }
}
