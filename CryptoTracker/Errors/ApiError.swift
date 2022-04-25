//
//  ApiError.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation


enum APiError: Error {
    case decodingError
    case unknown
    case errorCode(Int)
    case withMessage(Any)
}


extension APiError: LocalizedError{
    var errorDescription: String? {
        switch self {
        case .decodingError: return "An Error Occured whild Decoding Data"
        case .unknown: return "Unknown Error"
        case .errorCode (let code) : return "Error Code \(code) : - Something went wrong"
        case .withMessage(let msg) : return "\(msg)"
        }
    }
}
