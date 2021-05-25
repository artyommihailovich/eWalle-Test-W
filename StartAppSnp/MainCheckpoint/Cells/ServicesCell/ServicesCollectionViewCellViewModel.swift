//
//  ServicesCollectionViewCellViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/19/21.
//

import Foundation

final class ServicesCollectionViewCellViewModel: CollectionCellViewModel, CellItem {
    typealias Cell = ServicesCollectionViewCell
    
    let data: ServicesDataLite
    
    init(data: ServicesDataLite) {
        self.data = data
    }
    
    var title: String? {
        data.title
    }

    var image: Data {
        data.image
    }
    
}
