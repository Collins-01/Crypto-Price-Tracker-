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
    // We are doing this because we need to get the coin object, and it can only be accesed when the class is being initialized, i.e at the constructur. So we do here is that we use DI (Dependency Injection) Method to achieve this.
        
    @StateObject var vm: CoinDetailViewModel
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
        print("Initialising Detail View for \(coin.name)")
    }
     
    var body: some View {
        ZStack {
            Text("Hello ")

        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(coin: dev.coin)
    }
}



