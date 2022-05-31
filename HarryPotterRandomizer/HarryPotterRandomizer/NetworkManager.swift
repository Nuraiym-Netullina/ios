//
//  NetworkManager.swift
//  HarryPotterRandomizer
//
//  Created by Nuraiym Netullina on 22.05.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func onHouseModelDidUpdate(with model: HouseModel)
}

struct NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func fetchHouses() {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://wizard-world-api.herokuapp.com/Houses") else { return }
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode([HouseModel].self, from: data)
                        let house = decodedData[1]
                        delegate?.onHouseModelDidUpdate(with: house)
                    } catch {
                        print("Cathed Error: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchAlamofireHouses() {
        AF.request("https://wizard-world-api.herokuapp.com/Houses/").responseDecodable(of: [HouseModel].self) { response in
            switch response.result {
            case .success(let model):
                let house = model[0]
                delegate?.onHouseModelDidUpdate(with: house)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
