//
//  BodyView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/1/21.
//

import UIKit
import SnapKit

final class BodyView: UIView {
    
    private let viewModel: BodyViewModel
    
    private lazy var logoLabel = UILabel().do {
        $0.font = .with(weight: .logoMedium, size: .logo)
        $0.text = "eWalle"
    }
    
    private lazy var logoImageView = UIImageView().do {
        $0.image = UI.Images.logo
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var logoStackView = UIStackView().do {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 10
        $0.addArrangedSubviews(logoImageView,
                               logoLabel)
    }
    
    private lazy var descriptionLabel = UILabel().do {
        $0.text = viewModel.descriptionText
        $0.numberOfLines = 6
        $0.font = .with(weight: .regular, size: .text)
        $0.textColor = .grayCustom
    }
    
    private lazy var bodyStackView = UIStackView().do {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 10
        $0.addArrangedSubviews(logoStackView,
                               descriptionLabel)
    }
    
    required init(viewModel: BodyViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(bodyStackView)
        
        logoStackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        
        bodyStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

