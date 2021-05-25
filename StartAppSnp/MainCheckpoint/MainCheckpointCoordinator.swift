//
//  MainCheckpointCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/15/21.
//

import Foundation


final class MainCheckpointCoordinator {
    private let model = MainModel()
    private(set) lazy var viewModel = MainCheckpointViewModel(model: model)
    private(set) lazy var viewController = MainCheckpointViewController(viewModel: viewModel)
    private(set) lazy var mainAndMenuViewController = MainAndMenuContainerViewController()
}
