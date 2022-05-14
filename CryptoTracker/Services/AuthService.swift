//
//  AuthService.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 5/2/22.
//

import Foundation
import Combine

class AuthService {
    private var cancellables = Set<AnyCancellable>()
    @Published var  user: User?
    func login(email:String, password: String) {
        NetworkService.post(url: EndPoints.login , body: [ "username": email, "password": password])
            .decode(type: UserResponse.self, decoder: JSONDecoder())
            
        
//        .sink(receiveCompletion: NetworkService.handleCompletion) { [ weak self ]  ( response ) in
//            print(response.message)
//            guard let self = self else { return }
//            self.user = response.user
//            print("User --- \(self.user)")
//        }
//        .store(in: &cancellables)
    
    
    }
    
    
    func signIn(email:String, password:String) {
        
    }
    
    func logOut()  {
        
    }
}
