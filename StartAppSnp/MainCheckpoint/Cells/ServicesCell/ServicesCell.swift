//
//  ServicesCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/19/21.
//

import UIKit
import SnapKit

final class ServicesCell: UITableViewCell, ViewModelAcceptingTableViewCell {
    
    typealias ViewModel = ServicesCellViewModel
    
    var viewModel: ServicesCellViewModel?
    
    private lazy var titleLabel = UILabel().do {
        $0.text = "Services"
        $0.textColor = .blueCustom
        $0.font = .with(weight: .bold, size: .subTitle)
    }
    
    private lazy var button = UIButton().do {
        $0.setImage(UI.ButtonIcons.filter, for: .normal)
    }
    
    private lazy var titleStack = UIStackView().do {
        $0.axis = .horizontal
        $0.addArrangedSubviews(titleLabel, button)
    }
    
    private lazy var collectionViewLayout = UICollectionViewFlowLayout().do {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 16
        $0.minimumLineSpacing = 16
        $0.itemSize = CGSize(width: 75, height: 110)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).do {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.register(ServicesCollectionViewCell.self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(titleStack,
                    collectionView)
        
        titleStack.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleStack.snp.bottom).offset(20)
            $0.height.equalTo(350)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
}

extension ServicesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.collectionCells.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel?.collectionCells[indexPath.row].itemCell(for: indexPath, in: collectionView) ?? UICollectionViewCell()
    }
}
