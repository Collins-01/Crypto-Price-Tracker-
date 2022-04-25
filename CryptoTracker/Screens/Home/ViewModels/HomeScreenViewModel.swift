//
//  HomeScreenViewModel.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    @Published var  allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
   
    init() {
       addSubscribers()
        }

    
    
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}


