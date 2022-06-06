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
        
    @StateObject private  var vm: CoinDetailViewModel
    private  let spacing:CGFloat = 30
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
        print("Initialising Detail View for \(coin.name)")
    }
     
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("Hello World")
                    .frame(height: 150)
                Text("Overview")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: spacing,
                          pinnedViews: [],
                          
                          content: {
//
                    ForEach(vm.overviewStatistics) { stat in
                        StatisticsView(stat: StatisticsModel(title: stat.title, value: stat.value))
                    }
                })
                
                Text("Additional Details")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: spacing,
                          pinnedViews: [],
                          
                          content: {
//
                    ForEach(vm.additionalStatistics) { stat in
                        StatisticsView(stat: StatisticsModel(title: stat.title, value: stat.value))
                    }
                })
            }
            .padding()
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(coin: dev.coin)
                .navigationTitle(dev.coin.name)
        }
    }
}



