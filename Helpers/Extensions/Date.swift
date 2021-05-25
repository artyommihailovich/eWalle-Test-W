//
//  Date.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/17/21.
//

import Foundation

public enum DateFormat: String {
    case timeAMPM = "h:mm a"
    case dateMDY = "MMM. d. yyyy"
    case dayFull = "EEEE"
}

extension Date {
    func string(with format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
