//
//  HomeScreenViewModel.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    @Published var statistics: [StatisticsModel] = []
       
        

    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    @Published var  allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    init() {
        addSubscribers()
    }
    
    
    
    
    func addSubscribers() {
        $searchText.combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (recivedValue) in
                self?.allCoins = recivedValue
            }
            .store(in: &cancellables)
        
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        
    }
    
    
 private   func filterCoins(text: String , coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowerCased = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowerCased) || coin.symbol.lowercased().contains(lowerCased) || coin.id.lowercased().contains(lowerCased)
        }
    }
    
    
    
  private  func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticsModel] {
    var stats: [StatisticsModel] = []
    guard let data = marketDataModel else{
        return stats
    }
    let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
    let volume = StatisticsModel(title: "24h Volume", value: data.volume)
    let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominance)
    let portfolioValue = StatisticsModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
    stats.append(contentsOf: [
        marketCap,
        volume,
        btcDominance,
        portfolioValue
        
    ])
    return stats
    }
}


