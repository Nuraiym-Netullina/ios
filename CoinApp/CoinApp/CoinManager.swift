//
//  CoinManager.swift
//  CoinApp
//
//  Created by Arman Myrzakanurov on 28.05.2022.
//

import Foundation

struct CoinManager {
    
    func fetchCoinRate(with currency: String) {
        let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apiKey=283C75AE-C281-4F61-9AB7-924B015E0D3D"
        print(urlString)
    }
    
}
