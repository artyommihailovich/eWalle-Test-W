//
//  StartCheckpointCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/1/21.
//

import UIKit

final class StartCheckpointCoordinator {
    private let model = StartCheckpointModel()
    private(set) lazy var viewModel = StartCheckpointViewModel(model: model)
    private(set) lazy var viewController = StartCheckpointViewController(viewModel: viewModel)
}
