//
//  SendMoneyCell.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/16/21.
//

import UIKit
import SnapKit

final class SendMoneyCell: UITableViewCell, ViewModelAcceptingTableViewCell {
    typealias ViewModel = SendMoneyCellViewModel
    
    var viewModel: SendMoneyCellViewModel?
    
    private lazy var titleLabel = UILabel().do {
        $0.text = "Send Money"
        $0.textColor = .blueCustom
        $0.font = .with(weight: .bold, size: .subTitle)
    }
    
    private lazy var button = UIButton().do {
        $0.setImage(UI.ButtonIcons.qr, for: .normal)
    }
    
    private lazy var titleStack = UIStackView().do {
        $0.axis = .horizontal
        $0.addArrangedSubviews(titleLabel, button)
    }
    
    private lazy var collectionViewLayout = UICollectionViewFlowLayout().do {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 16
        $0.minimumLineSpacing = 16
        $0.itemSize = CGSize(width: 100, height: 120)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).do {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.register(SendMoneyCollectionViewCell.self)
        $0.register(SendMoneyGroupCollectionViewCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(titleStack, collectionView)
        
        titleStack.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleStack.snp.bottom)
            $0.height.equalTo(200)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

extension SendMoneyCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let items = viewModel?.collectionCells.count ?? 1
        return items + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            return viewModel?.subCollectionCell.itemCell(for: indexPath, in: collectionView) ?? UICollectionViewCell()
        } else {
            return viewModel?.collectionCells[indexPath.item - 1].itemCell(for: indexPath, in: collectionView)  ??  UICollectionViewCell()
        }
    }
}
