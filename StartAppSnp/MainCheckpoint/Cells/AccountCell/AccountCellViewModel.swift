//
//  AccountCellViewModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/15/21.
//

import Foundation


final class AccountCellViewModel: TableCellViewModel, CellItem {
    typealias Cell = AccountCell
    
    let balance: String
    
    init(balance: String) {
        self.balance = balance
    }
}
