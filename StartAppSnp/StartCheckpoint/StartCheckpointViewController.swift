//
//  StartCheckpointViewController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/1/21.
//

import UIKit
import SnapKit

final class StartCheckpointViewController: UIViewController {
    
    private let viewModel: StartCheckpointViewModel
    weak var coordinator: AppCoordinator?
    
    private lazy var imageView = UIImageView().do {
        $0.image = UI.Images.cover
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var headerView = HeaderViewCoordinator().view
    private lazy var bodyView = BodyViewCoordinator().view
    
    private lazy var signInButton = UIButton().do {
        $0.setTitle("Sign in →", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = .orangeCustom
        $0.titleLabel?.font = .with(weight: .bold, size: .button)
        $0.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var createAccountButton = UIButton().do {
        $0.setTitle("Create an account", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .with(weight: .thin, size: .button)
        $0.addTarget(self, action: #selector(createAccountButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var buttonsStackView = UIStackView().do {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .fill
        $0.distribution = .fill
        $0.addArrangedSubviews(signInButton,
                               createAccountButton)
    }
    
    private let contentStackView = UIStackView().do {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .equalSpacing
    }
    
    
    init(viewModel: StartCheckpointViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        headerView.viewModel.timer?.invalidate()
    }
    
    private func setupSubviews() {
        view.addSubviews(imageView,
                         contentStackView)
        
        contentStackView.addArrangedSubviews(headerView,
                                             bodyView,
                                             buttonsStackView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalTo(contentStackView.snp.left).inset(50)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(35)
            $0.width.equalTo(190)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.width.equalTo(170)
            $0.height.equalTo(100)
        }
    }
    
    @objc
    private func signInButtonDidTap() {
        coordinator?.eventHappened(with: .signInButtonTapped)
    }
    
    @objc
    private func createAccountButtonDidTap() {
        coordinator?.eventHappened(with: .createAnAccountButtonTapped)
    }
}
