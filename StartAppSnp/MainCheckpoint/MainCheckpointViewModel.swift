//
//  MainCheckpointViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/15/21.
//

import Foundation

final class MainCheckpointViewModel {
    
    private let model: MainModel
    
    init(model: MainModel) {
        self.model = model
    }
    
    private(set) lazy var cells = makeCells()
    
    private func makeCells() -> [CellItem] {
        return [AccountCellViewModel(balance: balanceFormat()),
                SendMoneyCellViewModel(model: model),
                ServicesCellViewModel(model: model)
        ]
    }
    
    private func balanceFormat() -> String {
        let balance = model.currentBalance.balance
        let stringBalance = String(format: "%5.3f", balance)
            .replacingOccurrences(of: ".", with: ",")
        return stringBalance
    }
}
