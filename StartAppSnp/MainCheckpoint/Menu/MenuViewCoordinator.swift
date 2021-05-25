//
//  MenuViewCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/20/21.
//

import UIKit

final class MenuViewCoordinator {    
    private let model = MainModel()
    private(set) lazy var viewModel = MenuViewModel(model: model)
    private(set) lazy var viewController = MenuViewController(viewModel: viewModel)
}
