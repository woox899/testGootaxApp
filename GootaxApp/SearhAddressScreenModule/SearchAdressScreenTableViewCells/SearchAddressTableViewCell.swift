//
//  SearchAddressTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 14.05.2024.
//

import UIKit
import SnapKit

enum SearchAddressTableViewCellType {
    case myLocation
    case adress
}

struct SearchAddressTableViewCellModel {
    let type: SearchAddressTableViewCellType
    let adress: Address
}

final class SearchAddressTableViewCell: UITableViewCell {
    
    static let reuseID = "SearchAddressTableViewCell"

    private let addressTitleLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.font = .systemFont(ofSize: 16)
        addressLabel.adjustsFontSizeToFitWidth = true
        return addressLabel
    }()
    
    private let addressSubTitleLabel: UILabel = {
        let addressSubTitleLabel = UILabel()
        addressSubTitleLabel.font = .systemFont(ofSize: 14, weight: .light)
        addressSubTitleLabel.adjustsFontSizeToFitWidth = true
        return addressSubTitleLabel
    }()
    
    private let addressImageView: UIImageView = {
        let addressImageView = UIImageView()
        return addressImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: SearchAddressTableViewCellModel) {
        switch model.type {
        case .myLocation:
            addressTitleLabel.text = "Текущее местоположение"
            addressSubTitleLabel.text = ""
            addressSubTitleLabel.isHidden = true
            addressImageView.image = UIImage(named: "myLocationImage")
        case .adress:
            addressTitleLabel.text = model.adress.value
            addressSubTitleLabel.text = model.adress.unrestrictedValue
            addressSubTitleLabel.isHidden = false
            addressImageView.image = UIImage(named: "locationImage")
        }
    }
    
    private func setupUI() {
        contentView.addSubviews([addressTitleLabel, addressSubTitleLabel, addressImageView])
        
        addressTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(addressImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalTo(addressSubTitleLabel.snp.top).offset(-3)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        addressSubTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(addressImageView.snp.trailing).offset(15)
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        addressImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.width.equalTo(20)
        }
    }
}
