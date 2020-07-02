//
//  FullResponse.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

/*
 "total": 4692,
 "totalHits": 500,
 "hits": [
     {
    <<<IMAGE>>>
 }
 ]
 */

struct FullResponse : Codable {
    var total : Float
    var totalHits : Float
    var hits : [Image]
}
