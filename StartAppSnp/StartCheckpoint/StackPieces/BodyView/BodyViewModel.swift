//
//  BodyViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/3/21.
//

import Foundation

final class BodyViewModel {
    private let model: StartCheckpointModel
    
    init(model: StartCheckpointModel) {
        self.model = model
    }
    
    private(set) lazy var descriptionText: String = {
        model.description.text
    }()
}
