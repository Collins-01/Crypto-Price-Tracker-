//
//  HomeScreen.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/24/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var showPortfolio:Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
              homeHeader
                Spacer()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


extension HomeScreen {
    private var homeHeader : some View {
        HStack{
            
            BuildCircleButton(iconName: showPortfolio ? "plus" : "info")
//                        .animation(.none)
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
}
