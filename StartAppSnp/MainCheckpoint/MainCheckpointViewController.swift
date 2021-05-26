//
//  MainCheckpointViewController.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/15/21.
//

import UIKit

final class MainCheckpointViewController: UIViewController {
    
    private let viewModel: MainCheckpointViewModel
    
    weak var coordinator: AppCoordinator?
    weak var delegate: MainCheckpointViewControllerDelegate?
    
    private lazy var logoImageView = UIImageView().do {
        $0.image = UI.Images.logo
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var logoLabel = UILabel().do {
        $0.font = .with(weight: .logoMedium, size: .logoHorizontal)
        $0.text = "eWalle"
    }
    
    private lazy var logoStackView = UIStackView().do {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 10
        $0.addArrangedSubviews(logoImageView,
                               logoLabel)
    }
    
    private lazy var menuButton = UIButton().do {
        $0.setImage(UI.ButtonIcons.menu, for: .normal)
        $0.setImageTintColor(.purpleText!)
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
    }

    private lazy var tableView = UITableView().do {
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 300
        $0.backgroundColor = .backgroundColor
        $0.showsVerticalScrollIndicator = false
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.allowsSelection = false
        $0.register(AccountCell.self)
        $0.register(SendMoneyCell.self)
        $0.register(ServicesCell.self)
    }
    
    init(viewModel: MainCheckpointViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .backgroundColor
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarItems()
    }
    
    private func setupSubviews() {
        view.addSubviews(tableView)
        
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(35)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBarItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoStackView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem?.tintColor = .purpleText
        navigationController?.navigationBar.barTintColor = .backgroundColor
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc
    private func menuButtonTapped() {
        delegate?.menuButtonDidTap()
    }
}

extension MainCheckpointViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cells[indexPath.row].itemCell(for: indexPath, in: tableView)
    }
}

