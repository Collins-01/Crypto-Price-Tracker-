//
//  HomeScreen.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/24/22.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var vm : HomeScreenViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioScreen().environmentObject(vm)
                })
            VStack{
                homeHeader
                HomeStatsScreen(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
               columnTitles
                .foregroundColor(Color.theme.secondaryText)
                if !showPortfolio {
                   allCoinsList
                    .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreen()
                .navigationBarHidden(true)
            
            
        }
        .environmentObject(dev.homeViewModel)
    }
}


extension HomeScreen {
    private var homeHeader : some View {
        HStack{
            
            BuildCircleButton(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture{
//                    print(vm.portfolioCoins.count)
                    print("Hello")
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background(BuildCircleButtonAnimation(animate: $showPortfolio))
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            BuildCircleButton(iconName: "chevron.right")
                .onTapGesture{
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
            
        }
        .padding(.horizontal)
    }
    
    
    
    private  var allCoinsList: some View {
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private  var portfolioCoinsList: some View {
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    private var columnTitles: some View{
        HStack{
            HStack (spacing: 4) {
                Text("Coins")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed ) ? 1.0: 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0: 180))
                    .onTapGesture{
                        withAnimation (.default) {
//                            vm.sortOption = .rank ? .rankReversed : .rank
                            if vm.sortOption == .rank {
                                vm.sortOption = .rankReversed
                            }
                            else{
                                vm.sortOption = .rank
                            }
                        }
                       
                    }
            }
            
            Spacer()
            if showPortfolio{
                HStack (spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed ) ? 1.0: 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0: 180))
                        .onTapGesture{
                            withAnimation (.default) {
    //                            vm.sortOption = .rank ? .rankReversed : .rank
                                if vm.sortOption == .holdings {
                                    vm.sortOption = .holdingsReversed
                                }
                                else{
                                    vm.sortOption = .holdings
                                }
                            }
                           
                        }

                }
                
            }
            
            HStack (spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed ) ? 1.0: 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0: 180))
                    .onTapGesture{
                        withAnimation (.default) {
//                            vm.sortOption = .rank ? .rankReversed : .rank
                            if vm.sortOption == .price {
                                vm.sortOption = .priceReversed
                            }
                            else{
                                vm.sortOption = .price
                            }
                        }
                       
                    }

            }
                .frame(width: UIScreen.main.bounds.width/3.5 , alignment: .trailing)
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
            

        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
