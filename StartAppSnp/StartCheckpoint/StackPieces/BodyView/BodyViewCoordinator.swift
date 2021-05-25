//
//  BodyViewCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/3/21.
//

import Foundation

final class BodyViewCoordinator {
    private let model = StartCheckpointModel()
    private(set) lazy var viewModel = BodyViewModel(model: model)
    private(set) lazy var view = BodyView(viewModel: viewModel)
}
