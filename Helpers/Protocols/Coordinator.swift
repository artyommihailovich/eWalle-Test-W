//
//  Coordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 3/16/21.
//

import UIKit

public enum MenuItem {
    case home
    case profile
    case accounts
    case transactions
    case stats
    case settings
    case help
    case logout                             
}

public enum Event {
    case signInButtonTapped
    case createAnAccountButtonTapped
}

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

public protocol Coordinate {
    var coordinator: Coordinator { get set }
}
