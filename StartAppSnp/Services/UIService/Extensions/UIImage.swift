//
//  UIImage.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/19/21.
//

import UIKit

extension UIImage {
    func imageResize(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
