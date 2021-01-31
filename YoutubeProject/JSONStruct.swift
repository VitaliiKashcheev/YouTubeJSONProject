//
//  JSONStruct.swift
//  YoutubeProject
//
//  Created by Виталий on 1/31/21.
//  Copyright © 2021 Виталий. All rights reserved.
//

import Foundation

struct JSONStruct: Codable {
    
    var weather: [Weather]
    var base: String
    var name: String
    var main: Main
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    
}

struct Main: Codable {
    var temp: Double
    var feels_like: Double
}
