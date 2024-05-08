//
//  PromoSectionCollectionViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 04.05.2024.
//

import UIKit
import SnapKit

final class PromoSectionCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PromoSectionCollectionViewCell"
    
    private var model: PromoSectionModel?

    private let promoSectionView: UIView = {
        let promoSectionView = UIView()
        return promoSectionView
    }()
    
    private let promoSectionImageView: UIImageView = {
        let promoSectionImageView = UIImageView()
        promoSectionImageView.contentMode = .scaleAspectFit
        return promoSectionImageView
    }()
    
    private let promoSectionLabel: UILabel = {
        let promoSectionLabel = UILabel()
        promoSectionLabel.font = .systemFont(ofSize: 12)
        promoSectionLabel.textAlignment = .center
        promoSectionLabel.adjustsFontSizeToFitWidth = true
        return promoSectionLabel
    }()
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: PromoSectionModel) {
        self.model = model
        promoSectionImageView.image = model.image
        promoSectionLabel.text = model.description
    }
    
    private func setupUI() {
        addSubview(promoSectionView)
        promoSectionView.addSubviews([promoSectionImageView, promoSectionLabel])

        promoSectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        promoSectionImageView.snp.makeConstraints { make in
            make.top.equalTo(promoSectionView.snp.top).offset(5)
            make.width.equalTo(68)
            make.height.equalTo(53)
            make.centerX.equalTo(promoSectionView.snp.centerX)
        }
        
        promoSectionLabel.snp.makeConstraints { make in
            make.top.equalTo(promoSectionImageView.snp.bottom).offset(5)
            make.leading.equalTo(promoSectionImageView.snp.leading)
            make.trailing.equalTo(promoSectionImageView.snp.trailing)
        }
    }
}
