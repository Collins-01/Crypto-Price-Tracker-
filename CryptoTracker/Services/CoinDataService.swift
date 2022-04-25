//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation


class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    
    init() {
        getCoins()
    }
    
    private  func getCoins()  {
        guard let url = URL(string: "") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.global(qos: .default))
        
        
        
        
//            .subscribe(on: DispatchQueue.global(qos: .default))
//            .tryMap{ ( output ) -> Data in
//                guard let response = output.response  as? HTTPURLResponse, response.statusCode >=200 && response.statusCode < 300  else {
//                    throw URLError(.badServerResponse)
//                }
//                //
//
//
//            }
    }
}
