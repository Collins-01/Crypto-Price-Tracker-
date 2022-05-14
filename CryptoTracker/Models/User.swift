//
//  User.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 5/2/22.
//

import Foundation



struct UserResponse : Decodable {
//    let message: String
//    let token: String
//    let user: User
    let fullname: String
}



struct User: Codable {
    let username: String
    
}
