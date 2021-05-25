//
//  ServicesCellViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/19/21.
//

import Foundation
import UIKit


final class ServicesCellViewModel: TableCellViewModel, CellItem  {
    typealias Cell = ServicesCell
    
    let model: MainModel
    
    init(model: MainModel) {
        self.model = model
    }
    
    private(set) lazy var collectionCells: [CellItem] = model.services.map {
        ServicesCollectionViewCellViewModel(data: $0)
    }
}
