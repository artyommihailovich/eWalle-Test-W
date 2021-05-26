//
//  ServicesCollectionViewCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/19/21.
//

import UIKit
import SnapKit

final class ServicesCollectionViewCell: UICollectionViewCell, ViewModelAcceptingCollectionViewCell {
    typealias ViewModel = ServicesCollectionViewCellViewModel
    
    var viewModel: ServicesCollectionViewCellViewModel? {
        didSet {
            button.setImage(UIImage(data: viewModel!.image), for: .normal)
            titleLabel.text = viewModel?.title
        }
    }
    
    private lazy var button = UIButton().do {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.imageView?.contentMode = .scaleAspectFit
        $0.imageEdgeInsets = UIEdgeInsets(top: 23, left: 23, bottom: 23, right: 23)
        $0.backgroundColor = .subBackground
    }
    
    private lazy var titleLabel = UILabel().do {
        $0.font = .with(weight: .regular, size: .small)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .purpleText
    }
    
    private lazy var contentStack = UIStackView().do {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillProportionally
        $0.addArrangedSubviews(button, titleLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(contentStack)
        
        button.snp.makeConstraints {
            $0.height.equalTo(70)
        }
        
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
