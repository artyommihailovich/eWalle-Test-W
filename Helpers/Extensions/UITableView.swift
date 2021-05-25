//
//  UITableView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 3/15/21.
//

import UIKit

public extension UITableView {
    func dequeueCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: Cell.id, for: indexPath) as! Cell
    }

    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.id)
    }
}

