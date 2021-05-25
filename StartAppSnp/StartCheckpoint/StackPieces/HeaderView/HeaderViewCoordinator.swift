//
//  HeaderViewCoordinator.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/3/21.
//

import Foundation

final class HeaderViewCoordinator {
    private let model = StartCheckpointModel()
    private(set) lazy var viewModel = HeaderViewModel(model: model)
    private(set) lazy var view = HeaderView(viewModel: viewModel) 
}
