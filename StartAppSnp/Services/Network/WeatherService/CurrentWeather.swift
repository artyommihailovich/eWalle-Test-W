//
//  CurrentWeather.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/23/21.
//

import Foundation

final class CurrentWeather {
    
    private let temperature: Double
    
    var temperatureString: String {
        return String(Int(temperature))
    }
    
    init?(data: WeatherData) {
        temperature = data.main.temp
    }
}
