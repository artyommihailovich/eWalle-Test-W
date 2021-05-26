//
//  UIButton.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/26/21.
//

import UIKit

extension UIButton {
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}
