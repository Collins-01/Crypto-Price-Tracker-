//
//  EndPoints.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation


struct EndPoints {
    private static let api: String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    static var allCoins: URLRequest {
        let url: URL = URL(string: api)!
        return URLRequest(url: url)
    }
    
    
    static var getAllCoins: URL {
        return URL(string: api)!
    }
}
