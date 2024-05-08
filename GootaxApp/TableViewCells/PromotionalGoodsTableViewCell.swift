//
//  PromotionalGoodsTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SnapKit

final class PromotionalGoodsTableViewCell: UITableViewCell {
    
    static let reuseID = "PromotionalGoodsTableViewCell"
    
    private let promotionalGoodsDataSourse = PromotionalGoodsSectionModel.fetchPromotionalGoodsSection()
    
    private lazy var promotionalGoodsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize.width = 102
        layout.itemSize.height = 208
        layout.itemSize.height = 208
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        collectionView.register(PromotionalGoodsCollectionViewCell.self, forCellWithReuseIdentifier: PromotionalGoodsCollectionViewCell.reuseID)
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Акции"
        titleLabel.font = .systemFont(ofSize: 25)
        return titleLabel
    }()
    
    private let showAllButton: UIButton = {
        let showAllButton = UIButton()
        showAllButton.setTitle("Смотреть все", for: .normal)
        showAllButton.setTitleColor(.black, for: .normal)
        showAllButton.titleLabel?.font = .systemFont(ofSize: 12)
        showAllButton.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        showAllButton.layer.cornerRadius = 12
        return showAllButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotionalGoodsDataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionalGoodsCollectionViewCell.reuseID, for: indexPath) as? PromotionalGoodsCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: promotionalGoodsDataSourse[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Блок с акционными товарами")
    }
    
    private func setupUI() {
        contentView.addSubview(promotionalGoodsCollectionView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(showAllButton)
        
        promotionalGoodsCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        showAllButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.top.equalTo(contentView.snp.top).offset(5)
            make.width.equalTo(103)
            make.height.equalTo(25)
        }
    }
}

extension PromotionalGoodsTableViewCell: UICollectionViewDelegate {
    
}

extension PromotionalGoodsTableViewCell: UICollectionViewDataSource {
    
}


