//
//  UIViewController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/21/21.
//

import UIKit

extension UIViewController {
    func addChilds(_ childControllers: UIViewController...)  {
        childControllers.forEach(addChild)
    }
}
