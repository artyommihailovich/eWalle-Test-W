//
//  UIFont.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/16/21.
//

import UIKit

extension UIFont {
    static func `with`(weight: UI.FontWeight, size: UI.FontSize) -> UIFont {
        UIFont(name: weight.rawValue, size: size.rawValue ) ?? UIFont.systemFont(ofSize: 50)
    }
}
