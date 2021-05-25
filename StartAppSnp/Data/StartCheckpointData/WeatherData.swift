//
//  WeatherData.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/17/21.
//

import Foundation

struct WeatherData: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
