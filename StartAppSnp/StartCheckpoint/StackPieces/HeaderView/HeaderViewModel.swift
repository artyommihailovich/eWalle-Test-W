//
//  HeaderViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/3/21.
//

import Foundation
import CoreLocation

final class HeaderViewModel {
    
    private let model: StartCheckpointModel
    var weatherServicve = WeatherService()
    var timer: Timer?
    
    lazy var locationManager = CLLocationManager().do {
        $0.delegate = weatherServicve
        $0.desiredAccuracy = kCLLocationAccuracyKilometer
        $0.requestWhenInUseAuthorization()
    }
    
    init(model: StartCheckpointModel) {
        self.model = model
    }
    
    private(set) lazy var date: String = {
        model.date.currentDate.string(with: .dateMDY)
    }()
    
    private(set) lazy var dayOfWeek: String = {
        model.date.dayOfweek.string(with: .dayFull)
    }()
    
    private(set) lazy var weather: String = {
        "\(Int(model.weather.main.temp))" + " Cº"
    }()
}
