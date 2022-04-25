//
//  NetworkService.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation
import Combine


class NetworkService {
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown
//
        
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(url: let url): return "[🔥] Bad Response from URL: \(url)"
            case .unknown : return "[😩] An Unknown Error has occured."
                
            }
        }
    }
    static func get(url: URL)-> AnyPublisher<Data,Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap( { try handleUrlResponse(output: $0, url: url)})
            
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    static func handleUrlResponse (output: URLSession.DataTaskPublisher.Output, url: URL ) throws -> Data {
        
        guard let response = output.response as? HTTPURLResponse , (200...299).contains(response.statusCode) else {
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    static func handleCompletion (completion: Subscribers.Completion<Error> ) {
        switch completion {
        case .finished: break
        case .failure(let error ):
            print(error.localizedDescription)
        }
    }
}
