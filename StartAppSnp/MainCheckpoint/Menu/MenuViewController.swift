//
//  MenuViewController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/20/21.
//

import UIKit

final class MenuViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuCase: String, CaseIterable {
        case home
        case profile
        case accounts
        case transactions
        case stats
        case settings
        case help
    }
    
    private let viewModel: MenuViewModel
    
    private lazy var avatarImageView = UIImageView().do {
        $0.image = UIImage(data: viewModel.image)
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var nameLabel = UILabel().do {
        $0.text = viewModel.currentUser
        $0.font  = .with(weight: .bold, size: .text)
    }
    
    private lazy var cityLabel = UILabel().do {
        $0.text = viewModel.city
        $0.font  = .with(weight: .regular, size: .small)
        $0.textColor = .grayCustom
    }
    
    private lazy var labelsStack = UIStackView().do {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.addArrangedSubviews(nameLabel, cityLabel)
    }
    
    private lazy var userContactStack = UIStackView().do {
        $0.axis =  .horizontal
        $0.alignment = .center
        $0.spacing = 12
        $0.addArrangedSubviews(avatarImageView,labelsStack)
    }
    
    private lazy var closeButton = UIButton().do {
        $0.setImage(UI.ButtonIcons.closeButton, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        $0.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var viewWithStack = UIView().do {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 53
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    private lazy var versionLabel = UILabel().do {
        $0.text = viewModel.version
        $0.textAlignment = .left
        $0.textColor = .subPurple
        $0.font = .with(weight: .thin, size: .small)
    }
    
    private lazy var logoutButton = UIButton().do {
        $0.setTitle(" Logout", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .with(weight: .bold, size: .button)
        $0.setImage(UI.ButtonIcons.logout, for: .normal)
    }
    
    private lazy var tableView = UITableView().do {
        $0.dataSource = self
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.rowHeight = 60
        $0.separatorStyle = .none
        $0.register(MenuTableViewCell.self)
        $0.isScrollEnabled = false
        $0.backgroundColor = .clear
    }
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        view.backgroundColor = .grayBackground
    }
    
    private func setupSubviews() {
        view.addSubviews(viewWithStack,
                         closeButton,
                         versionLabel,
                         logoutButton,
                         tableView)
        
        viewWithStack.addSubviews(userContactStack)
        
        userContactStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        viewWithStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.height.equalTo(120)
            $0.width.equalTo(200)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(14)
            $0.size.equalTo(40)
        }
        
        versionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(15)
        }
        
        logoutButton.snp.makeConstraints {
            $0.bottom.equalTo(versionLabel.snp.top).offset(-60)
            $0.left.equalToSuperview().inset(15)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints {
            $0.bottom.equalTo(logoutButton.snp.top)
            $0.left.equalToSuperview()
            $0.top.equalTo(viewWithStack.snp.bottom).offset(60)
            $0.width.equalTo(200)
        }
    }
    
    @objc
    private func closeButtonDidTap() {
        delegate?.closeButtonDidTap()
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuCase.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.id, for: indexPath) as! MenuTableViewCell
        cell.itemButton.setTitle(MenuCase.allCases[indexPath.row].rawValue.capitalized, for: .normal)
        return cell
    }
}
