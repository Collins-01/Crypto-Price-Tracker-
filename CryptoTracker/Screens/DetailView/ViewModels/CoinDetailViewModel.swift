//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 6/6/22.
//

import Foundation
import Combine

class CoinDetailViewModel: ObservableObject {
    private let  coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable> ()
    
    
    
    init(coin: CoinModel){
        coinDetailService = CoinDetailDataService(coin: coin )
        addSubscribers()
    }
    
    
    private func addSubscribers( ) {
      coinDetailService.$coinDetail.sink { [weak self] (coinDetail) in
            print("RECIEVED COIN DETAILS ---> \(coinDetail)")
         
        }
      .store(in: &cancellables)
    }
}
