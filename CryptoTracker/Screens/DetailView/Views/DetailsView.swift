//
//  DetailsView.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 5/30/22.
//

import SwiftUI


struct DetailLoadingView: View {
    @Binding var coin:CoinModel?
    var body: some View {
        ZStack {
            if let coin = coin  {
                DetailsView(coin: coin)
            }
        }
    }
}


struct DetailsView: View {
     var coin:CoinModel
    init(coin: CoinModel){
        self.coin = coin
        print("Initialising Detail View for \(coin.name)")
    }
    var body: some View {
        ZStack {
            if let coin = coin {
                Text(coin.name)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(coin: dev.coin)
    }
}



