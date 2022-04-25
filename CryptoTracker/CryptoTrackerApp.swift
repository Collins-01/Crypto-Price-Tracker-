//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/24/22.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject private var viewModel = HomeScreenViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeScreen()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
            
        }
        
        
    }
    
}
