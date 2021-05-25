//
//  MenuViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/20/21.
//

import Foundation

final class MenuViewModel {
    private let model: MainModel
    
    init(model: MainModel) {
        self.model = model
    }
    
    var currentUser: String {
        model.currentUser.name
    }
    
    var image: Data {
        model.currentUser.image
    }
    
    var city: String {
        model.currentUser.city
    }
    
    var version: String {
       "Version " + "\(model.developData.version)"
    }
}

