//
//  CatalogCollectionViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 05.05.2024.
//

import UIKit
import SnapKit

final class CatalogCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CatalogCollectionViewCell"
    
    private var model: CatalogSectionModel?
    
    private let catalogCollectionViewCell: UIView = {
        let catalogCollectionViewCell = UIView()
        catalogCollectionViewCell.layer.cornerRadius = 12
        return catalogCollectionViewCell
    }()
    
    private let catalogCollectionBackgroundImageView: UIImageView = {
        let catalogCollectionBackgroundImageView = UIImageView()
        return catalogCollectionBackgroundImageView
    }()
   
    private let catalogCollectionImageView: UIImageView = {
        let catalogCollectionImageView = UIImageView()
        return catalogCollectionImageView
    }()
    
    private let catalogCollectionDescriptionLabel: UILabel = {
        let catalogCollectionDescriptionLabel = UILabel()
        catalogCollectionDescriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        catalogCollectionDescriptionLabel.numberOfLines = 0
        catalogCollectionDescriptionLabel.adjustsFontSizeToFitWidth = true
        catalogCollectionDescriptionLabel.lineBreakMode = .byWordWrapping
        catalogCollectionDescriptionLabel.textAlignment = .center
        return catalogCollectionDescriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: CatalogSectionModel) {
        self.model = model
        catalogCollectionBackgroundImageView.image = model.backgroundImage
        catalogCollectionImageView.image = model.image
        catalogCollectionDescriptionLabel.text = model.description
    }
    
    private func setupUI() {
        addSubview(catalogCollectionViewCell)
        catalogCollectionViewCell.addSubview(catalogCollectionBackgroundImageView)
        catalogCollectionBackgroundImageView.addSubview(catalogCollectionImageView)
        catalogCollectionBackgroundImageView.addSubview(catalogCollectionDescriptionLabel)

        catalogCollectionViewCell.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
        
        catalogCollectionBackgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(catalogCollectionViewCell)
        }
        
        catalogCollectionImageView.snp.makeConstraints { make in
            make.leading.equalTo(catalogCollectionViewCell.snp.leading)
            make.top.equalTo(catalogCollectionViewCell.snp.top)
            make.trailing.equalTo(catalogCollectionViewCell.snp.trailing)
        }
        
        catalogCollectionDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(catalogCollectionBackgroundImageView.snp.leading).offset(10)
            make.trailing.equalTo(catalogCollectionBackgroundImageView.snp.trailing).offset(-10)
            make.bottom.equalTo(catalogCollectionBackgroundImageView.snp.bottom).offset(-10)
        }
    }
}



