//
//  SendMoneyCollectionViewCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/18/21.
//

import UIKit
import SnapKit

final class SendMoneyCollectionViewCell: UICollectionViewCell, ViewModelAcceptingCollectionViewCell {
    typealias ViewModel = SendMoneyCollectionCellViewModel
    
    var viewModel: SendMoneyCollectionCellViewModel?
    
    private lazy var plusButton = UIButton().do {
        $0.setImage(UI.ButtonIcons.plus, for: .normal)
        $0.backgroundColor = .backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(plusButton)
        
        plusButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
