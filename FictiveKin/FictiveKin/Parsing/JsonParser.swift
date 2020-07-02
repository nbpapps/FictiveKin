//
//  JsonParser.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum JsonError : Error { //conforms to error protocol
    case invalidJson(errorMessage : String)
}

struct JsonParser {
    
    private var data : Data
    private var decoder : JSONDecoder
    
    init(data : Data,decoder : JSONDecoder = JSONDecoder()) {
        self.data = data
        self.decoder = decoder
    }
    
    func decode<T : Decodable>() -> Result<T,JsonError>{
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            return .success(decodedObject)
        }
        catch {
            return .failure(.invalidJson(errorMessage: error.localizedDescription))
        }
    }
}
