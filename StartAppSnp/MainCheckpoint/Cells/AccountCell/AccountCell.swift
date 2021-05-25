//
//  AccountCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/15/21.
//

import UIKit
import SnapKit

final class AccountCell: UITableViewCell, ViewModelAcceptingTableViewCell {
    typealias ViewModel = AccountCellViewModel
    
    var viewModel: AccountCellViewModel? {
        didSet {
            currentBalance.text = viewModel?.balance
        }
    }
    
    private lazy var titleLabel = UILabel().do {
        $0.text = "Account Overview"
        $0.textColor = .blueCustom
        $0.font = .with(weight: .bold, size: .subTitle)
    }
    
    private lazy var currentBalance = UILabel().do {
        $0.font = .with(weight: .bold, size: .logo)
    }
    
    private lazy var currentBalanceLabel = UILabel().do {
        $0.text = "Current Balance"
        $0.textColor = .subPurple
        $0.font = .with(weight: .thin, size: .text)
    }
    
    private lazy var balanceStack = UIStackView().do {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 12
        $0.addArrangedSubviews(currentBalance,
                               currentBalanceLabel)
    }
    
    private lazy var plusButton = UIButton().do {
        $0.setImage(UI.ButtonIcons.plus, for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = $0.frame.size.height / 2
        $0.layer.masksToBounds = true
    }
    
    private lazy var cardStack = UIStackView().do {
        $0.axis = .horizontal
        $0.backgroundColor = .grayBackground
        $0.layer.cornerRadius = 12
        $0.layoutMargins = UIEdgeInsets(top: 25, left: 20, bottom: 30, right: 20)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.addArrangedSubviews(balanceStack, plusButton)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(titleLabel, cardStack)
        
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
        }
        
        cardStack.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(titleLabel.snp.left)
            $0.right.equalTo(titleLabel.snp.right)
            $0.height.equalTo(135)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
