//
//  MenuTableViewCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/24/21.
//

import UIKit
import SnapKit

final class MenuTableViewCell: UITableViewCell {
    
    lazy var itemButton = UIButton().do {
        $0.titleLabel?.font = .with(weight: .regular, size: .button)
        $0.setTitleColor(.black, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.addTarget(self, action: #selector(itemButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var colorView = UIView().do {
        $0.alpha = 0
        $0.backgroundColor = .orangeCustom
    }
    
    private lazy var contentStack = UIStackView().do {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 15
        $0.addArrangedSubviews(colorView, itemButton)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        selectedBackgroundView?.alpha = 0
    }
    
    private func setupSubview() {
        addSubviews(contentStack)
        
        colorView.snp.makeConstraints {
            $0.width.equalTo(4)
        }

        contentStack.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    @objc
    private func itemButtonDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.colorView.alpha = 1.0
            self.itemButton.titleLabel?.font = .with(weight: .bold, size: .button)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.3) {
                self.colorView.alpha = 0
                self.itemButton.titleLabel?.font = .with(weight: .regular, size: .button)
            }
        }
    }
}
