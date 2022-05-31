//
//  ViewController.swift
//  Films
//
//  Created by Nuraiym Netullina on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    let movies: [Movies] = [
        .init(name: "Turning Red", description: "W.Disney Studios Sony Pictures Releasing", image: #imageLiteral(resourceName: "me")),
        .init(name: "Luca", description: "An unlikely but strong friendship grows between a human being and a sea monster disguised as a human.", image: #imageLiteral(resourceName: "luca")),
        .init(name: "Encanto", description: "Encanto is the tale of an extraordinary family.", image: #imageLiteral(resourceName: "encanto")),
        .init(name: "Raya and the Last Dragon", description: "In a realm known as Kumandra, a re-imagined Earth inhabited by an ancient civilization, a warrior named Raya is determined to find the last dragon.", image: #imageLiteral(resourceName: "raya")),
        .init(name: "Ron's gone wrong", description: "The story of Barney, an awkward middle-schooler and Ron, his new walking, talking, digitally-connected device.", image: #imageLiteral(resourceName: "ron"))
    ]
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        thirdCollectionView.delegate = self
        let nib = UINib(nibName: "Films", bundle: Bundle(for: Films.self))
        collectionView.register(nib, forCellWithReuseIdentifier: "Films")
        secondCollectionView.register(nib, forCellWithReuseIdentifier: "Films")
        thirdCollectionView.register(nib, forCellWithReuseIdentifier: "Films")

        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Films", for: indexPath) as! Films
        cell.filmName.text = movies[indexPath.row].name
        cell.filmDescription.text = movies[indexPath.row].description
        cell.filmImage.image = movies[indexPath.row].image
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}

struct Movies {
    let name: String
    let description: String
    let image: UIImage
}
