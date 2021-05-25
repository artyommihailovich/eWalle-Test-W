//
//  SendMoneyGroupCollectionCellViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/16/21.
//

import Foundation

final class SendMoneyGroupCollectionCellViewModel: CollectionCellViewModel, CellItem {
    typealias Cell = SendMoneyGroupCollectionViewCell
    
    let data: UserData
    
    init(data: UserData) {
        self.data = data
    }
    
    var name: String {
        data.name
    }
    
    var image: Data {
        data.image
    }
}
