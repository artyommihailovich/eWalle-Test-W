//
//  UIImageView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/18/21.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        let radius = self.frame.height / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = false
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.purpleDetail.cgColor
        self.clipsToBounds = true
    }
}
