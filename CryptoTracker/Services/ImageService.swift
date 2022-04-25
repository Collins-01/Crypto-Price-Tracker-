//
//  ImageService.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation
import SwiftUI
import Combine



class ImageService {
    @Published var image: UIImage? = nil
    private var coin: CoinModel
    private var imageSubscribtion: AnyCancellable?
    private func getImage() {
        guard let url = URL(string: coin.image) else {
            return
        }
        NetworkService.get(url: url)
            .tryMap { (data) -> UIImage? in
                return  UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkService.handleCompletion) { [weak self] (recivedImage) in
                self?.image = recivedImage
                self?.imageSubscribtion?.cancel()
            }
        
        
    }
    init(coin: CoinModel) {
        self.coin = coin
        getImage()
    }
}
