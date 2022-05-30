//
//  LoginViewModel.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 5/2/22.
//

import Foundation



class LoginViewModel : ObservableObject {
    @Published var hasError: Bool = false;
    @Published var isLoading: Bool = false
    @Published var email:String = ""
    @Published var password: String = ""
    var authService: AuthService
    init(service: AuthService) {
        self.authService = service
    }
    
    func assSubscribers() {
        
    }
      
    func login(){
//        isLoading = true
//         authService.login(email: email, password: password)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.isLoading = false
//            self.hasError = true
//        }
        
    }
}
