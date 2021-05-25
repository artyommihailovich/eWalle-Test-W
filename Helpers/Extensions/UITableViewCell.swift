//
//  UITableViewCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 3/15/21.
//

import UIKit

public extension UITableViewCell {
    class var id: String {
        "\(self)"
    }
}

public extension UITableViewCell {
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
