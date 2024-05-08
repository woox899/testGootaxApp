//
//  CatalogTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SnapKit

final class CatalogTableViewCell: UITableViewCell {
    
    static let reuseID = "CatalogTableViewCell"
    
    private let catalogDataSourse = CatalogSectionModel.fetchCatalofSection()

    private lazy var catalogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize.width = UIScreen.main.bounds.width * 0.27
        layout.itemSize.height = layout.itemSize.width * 1.4
        layout.minimumLineSpacing = 12
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.reuseID)
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Каталог"
        titleLabel.font = .systemFont(ofSize: 25)
        return titleLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogDataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.reuseID, for: indexPath) as? CatalogCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: catalogDataSourse[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Каталог")
    }

    private func setupUI() {
        contentView.addSubview(catalogCollectionView)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }

        catalogCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top).offset(25)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

extension CatalogTableViewCell: UICollectionViewDelegate {
    
}

extension CatalogTableViewCell: UICollectionViewDataSource {
    
}



