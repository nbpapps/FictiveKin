//
//  NetworkService.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct NetworkService {
    func makeNetworkCall(for url : URL,with completion : @escaping (Result<Data,NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let networkError = error {
                //we have an error in the network call
                completion(.failure(.networkError(errorMessage: "\(networkError)")))
            }
            
            guard let networkResponse = response as? HTTPURLResponse, networkResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse(errorMessage: "\(String(describing: response))")))
                return
            }
            
            guard let receivedData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(receivedData))
        }
        
        task.resume()
    }
}
