//
//  PromoSectionTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SnapKit

final class PromoSectionTableViewCell: UITableViewCell {

    static let reuseID = "PromoSectionTableViewCell"
    
    private let promoDataSourse = PromoSectionModel.fetchPromoSection()
    
    private lazy var promoSectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize.width = 80
        layout.itemSize.height = 88
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        collectionView.register(PromoSectionCollectionViewCell.self, forCellWithReuseIdentifier: PromoSectionCollectionViewCell.reuseID)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promoDataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoSectionCollectionViewCell.reuseID, for: indexPath) as? PromoSectionCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: promoDataSourse[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Блок с промо разделами")
    }

    private func setupUI() {
        contentView.addSubview(promoSectionCollectionView)
        
        promoSectionCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

extension PromoSectionTableViewCell: UICollectionViewDelegate {
    
}

extension PromoSectionTableViewCell: UICollectionViewDataSource {
    
}
