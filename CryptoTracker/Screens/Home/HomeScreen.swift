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
            Text("Coins")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width/3.5 , alignment: .trailing)
        }
        .font(.caption)
        .padding(.horizontal)
    }
}
