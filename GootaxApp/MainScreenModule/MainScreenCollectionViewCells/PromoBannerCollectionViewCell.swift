//
//  PromoBannerCollectionViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 05.05.2024.
//

import UIKit
import SnapKit

final class PromoBannerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PromoBannerCollectionViewCell"
    
    private var model: PromoBannerModel?
    
    private let bannerSectionView: UIView = {
        let bannerSectionView = UIView()
        bannerSectionView.layer.cornerRadius = 12
        return bannerSectionView
    }()
    
    private let bannerSectionImageView: UIImageView = {
        let bannerSectionImageView = UIImageView()
        return bannerSectionImageView
    }()
    
    private let bannerSectionDescriptionFirstLabel: UILabel = {
        let bannerSectionDescriptionFirstLabel = UILabel()
        bannerSectionDescriptionFirstLabel.textColor = .white
        bannerSectionDescriptionFirstLabel.font = .systemFont(ofSize: 15)
        return bannerSectionDescriptionFirstLabel
    }()
    
    private let bannerSectionDescriptionSecondLabel: UILabel = {
        let bannerSectionDescriptionSecondLabel = UILabel()
        bannerSectionDescriptionSecondLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        bannerSectionDescriptionSecondLabel.textColor = .white
        return bannerSectionDescriptionSecondLabel
    }()
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: PromoBannerModel) {
        self.model = model
        bannerSectionImageView.image = model.image
        bannerSectionDescriptionFirstLabel.text = model.descriptionFirstLabel
        bannerSectionDescriptionSecondLabel.text = model.descriptionSecondLabel
    }
    
    private func setupUI() {
        addSubview(bannerSectionView)
        bannerSectionView.addSubview(bannerSectionImageView)
        bannerSectionImageView.addSubviews([bannerSectionDescriptionFirstLabel, bannerSectionDescriptionSecondLabel])

        bannerSectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bannerSectionImageView.snp.makeConstraints { make in
            make.edges.equalTo(bannerSectionView)
        }
        
        bannerSectionDescriptionFirstLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bannerSectionImageView.snp.centerY)
            make.leading.equalTo(bannerSectionImageView.snp.leading).offset(15)
            make.trailing.equalTo(bannerSectionImageView.snp.trailing).offset(-15)
        }
        
        bannerSectionDescriptionSecondLabel.snp.makeConstraints { make in
            make.leading.equalTo(bannerSectionImageView.snp.leading).offset(15)
            make.top.equalTo(bannerSectionDescriptionFirstLabel.snp.bottom).offset(5)
            make.trailing.equalTo(bannerSectionImageView.snp.trailing).offset(-15)
        }
    }
}

