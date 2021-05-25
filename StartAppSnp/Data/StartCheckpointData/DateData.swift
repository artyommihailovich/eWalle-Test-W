//
//  Date.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/17/21.
//

import Foundation
 
struct DateData {
    let currentTime: Date
    let currentDate: Date
    let dayOfweek: Date
    
    init(currentTime: Date, currentDate: Date, dayOfweek: Date) {
        self.currentTime = currentTime
        self.currentDate = currentDate
        self.dayOfweek = dayOfweek
    }
}
