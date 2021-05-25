//
//  SendMoneyCellViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/16/21.
//

import Foundation

final class SendMoneyCellViewModel: TableCellViewModel, CellItem {
    typealias Cell = SendMoneyCell
    
    private let model: MainModel
    
    init(model: MainModel) {
        self.model = model
    }
    
    private(set) lazy var collectionCells: [CellItem] = model.users.map {
       SendMoneyGroupCollectionCellViewModel(data: $0)
    }
    
    private(set) lazy var subCollectionCell: CellItem = SendMoneyCollectionCellViewModel()
}
