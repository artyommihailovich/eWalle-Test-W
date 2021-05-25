//
//  UINavigationController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/16/21.
//

import UIKit

public extension UINavigationController {
    static func translucentNavigationController() -> UINavigationController {
        UINavigationController().do {
            $0.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            $0.navigationBar.shadowImage = UIImage()
            $0.navigationBar.isTranslucent = true
            $0.view.backgroundColor = .clear
        }
    }
}
