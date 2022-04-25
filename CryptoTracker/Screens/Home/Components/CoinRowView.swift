//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/24/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
        
    }
    
}





extension CoinRowView {
    private  var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            BuildCoinImage(coinModel :  coin)
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading , 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    
    
    private var centerColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimal())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
            
        }
        .foregroundColor(Color.theme.accent)
    }
    
    
    
    private var rightColumn: some View{
        VStack(){
            Text(coin.currentPrice.asCurrencyWith2Decimal())
            Text(coin.priceChange24H?.asPercentageString() ?? "")
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }
        //            Takes 1/3 of the screen, since the app does not work on Landscape mode
        .frame(width: UIScreen.main.bounds.width/3.5 , alignment: .trailing)
    }
}

