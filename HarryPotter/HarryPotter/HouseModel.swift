//
//  HouseModel.swift
//  HarryPotter
//
//  Created by Arman Myrzakanurov on 21.05.2022.
//

import Foundation

struct HouseModel: Decodable {
    let name: String
    let houseColours: String
    let animal: String
    let element: String
}
