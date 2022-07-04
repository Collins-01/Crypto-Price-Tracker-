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
    @State private var showLaunchView : Bool = true
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    HomeScreen()
                        
                        .navigationBarHidden(true)
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(viewModel)
                
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
            
        }
        
        
    }
    
}
