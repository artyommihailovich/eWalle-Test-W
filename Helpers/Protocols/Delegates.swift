//
//  Delegates.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/21/21.
//

import Foundation

public protocol MainCheckpointViewControllerDelegate: AnyObject {
    func menuButtonDidTap()
}

public protocol MenuViewControllerDelegate: AnyObject {
    func closeButtonDidTap()
}
