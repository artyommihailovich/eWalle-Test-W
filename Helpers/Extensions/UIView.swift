//
//  UIView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/17/21.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
