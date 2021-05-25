//
//  SendMoneyGroupCollectionViewCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/16/21.
//

import UIKit
import SnapKit

final class SendMoneyGroupCollectionViewCell: UICollectionViewCell, ViewModelAcceptingCollectionViewCell {
    typealias ViewModel = SendMoneyGroupCollectionCellViewModel
    
    var viewModel: SendMoneyGroupCollectionCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.name
            imageView.image = UIImage(data: viewModel!.image)
        }
    }
    
    private lazy var nameLabel = UILabel().do {
        $0.font = .with(weight: .thin, size: .text)
        $0.textColor = .subPurple
    }
    
    private lazy var imageView = UIImageView().do {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .white
    }

    private lazy var contentStack = UIStackView().do {
        $0.axis = .vertical
        $0.alignment = .center
        $0.backgroundColor = .grayBackground
        $0.layer.cornerRadius = 12
        $0.spacing = 12
        $0.layer.masksToBounds = true
        $0.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 15, right: 0)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.addArrangedSubviews(imageView, nameLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        layoutIfNeeded()
    }

    override func layoutSubviews() {
        imageView.makeRounded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(contentStack)
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(55)
        }
        
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
