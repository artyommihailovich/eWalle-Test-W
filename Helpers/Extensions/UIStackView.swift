//
//  UIStackView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/17/21.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
