//
//  DataFetch.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    case invalidUrl
    case networkError(errorMessage : String)
    case invalidResponse(errorMessage : String)
    case invalidData
}

struct DataFetching {
    
    func requestImages(for searchText : String, at page : Int,with completion : @escaping (Result<FullResponse,NetworkError>) -> Void) {
        let networkService = NetworkService()
        
        guard let url = buildURL(for: searchText, with: page) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        networkService.makeNetworkCall(for: url) { (result) in
            switch result {
            case .success(let data):
                let parser = JsonParser(data: data)
                let parsedData : Result<FullResponse,JsonError> = parser.decode()
                switch parsedData {
                case .success(let fullResponse):
                    completion(.success(fullResponse))
                case .failure( _):
                    completion(.failure(.invalidData))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    private func buildURL(for searchText : String,with page : Int) -> URL? {
        let queryItems : [URLQueryItem] = [
            URLQueryItem(name: UrlBuilder.apiKey, value: UrlBuilder.apiValue),
            URLQueryItem(name: UrlBuilder.queryKey, value: searchText),
            URLQueryItem(name: UrlBuilder.pageKey, value: String(page))
        ]
        
        do {
            let url = try UrlBuilder(queryItems: queryItems).buildUrl()
            return url
        }catch{
            return nil
        }
    }
}
