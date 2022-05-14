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
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeScreen()
                    .navigationBarHidden(true)
                
            }
            .environmentObject(viewModel)
//            LoginScreen()
            
        }
        
        
    }
    
}
