//
//  ResultViewController.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var navigationTitleText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        title = navigationTitleText
    }
}
