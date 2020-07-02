//
//  UrlBuilder.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct UrlBuilder {
    private var queryItems : [URLQueryItem]
    
    //https://pixabay.com/api/?q=kittens&key=6814610-cd083c066ad38bb511337fb2b
    //https://pixabay.com/api/docs/
    
    private static let scheme = "https"
    private static let baseHost = "pixabay.com"
    private static let queryPath = "/api"
    
    static let apiKey = "key"
    static let apiValue = "6814610-cd083c066ad38bb511337fb2b"
    
    static let queryKey = "q"
    static let pageKey = "page"
    
    init(queryItems : [URLQueryItem]) {
        self.queryItems = queryItems
    }
    
    func buildUrl() throws -> URL {
        var comps = URLComponents()
        comps.scheme = UrlBuilder.scheme
        comps.host = UrlBuilder.baseHost
        comps.path = UrlBuilder.queryPath
        comps.queryItems = self.queryItems
        
        guard let url = comps.url else {
            throw NetworkError.invalidUrl
        }
        return url
    }
    
}
