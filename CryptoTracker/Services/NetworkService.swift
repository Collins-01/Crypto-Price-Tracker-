//
//  NetworkService.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 4/25/22.
//

import Foundation
import Combine


class NetworkService {
    func get(url: URL) -> AnyPublisher<T,APiError>  {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return  URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global(qos: .default))
            .mapError{ _ in APiError.unknown}
            .flatMap{  data, response -> AnyPublisher<T, APiError> in
                
                guard let response = request as? HTTPURLResponse else{
                    return   Fail(error: APiError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    //successfull response
//                    return Just(<#T##output: _##_#>)
                    
                }
                
                
                else {
                    let body = response.description
                    return Fail(error: APiError.withMessage(body)).eraseToAnyPublisher()
                
                }
            }
            .eraseToAnyPublisher()
    }
}



class T {
    
}
