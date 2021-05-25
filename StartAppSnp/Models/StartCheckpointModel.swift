//
//  StartCheckpointModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/3/21.
//

import Foundation

final class StartCheckpointModel {
    
    private(set) lazy var date: DateData = {
        DateData(
                 currentTime: Date(),
                 currentDate: Date(),
                 dayOfweek: Date())
    }()
    
    private(set) lazy var weather: WeatherData = {
        WeatherData(main: Main(temp: 34.0))
    }()
    
    private(set) lazy var description: StartCheckpointData = {
        StartCheckpointData(text: """
                        Open An Account For Digital
                        E-Wallet Solutions.
                        Instant Payouts.

                        Join For Free.
                        """)
    }()
}
