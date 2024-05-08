//
//  AddressSelectionTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SnapKit

final class AddressSelectionTableViewCell: UITableViewCell {
    
    static let reuseID = "AddressSelectionTableViewCell"
    
    private var hamburgerMenuButton: UIButton = {
        let hamburgerMenuButton = UIButton()
        hamburgerMenuButton.setImage(UIImage(named: "hamburgerButtonImage"), for: .normal)
        return hamburgerMenuButton
    }()
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return deliveryLabel
    }()
    
    private let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.text = "Пискунова, 24"
        addressLabel.font = UIFont.systemFont(ofSize: 16)
        return addressLabel
    }()
    
    private let dropDownListButton: UIButton = {
        let dropDownListButton = UIButton()
        dropDownListButton.setImage(UIImage(named: "downArrow"), for: .normal)
        return dropDownListButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(hamburgerMenuButton)
        contentView.addSubview(deliveryLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(dropDownListButton)
        
        hamburgerMenuButton.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        deliveryLabel.snp.makeConstraints { make in
            make.leading.equalTo(hamburgerMenuButton.snp.trailing).offset(30)
            make.top.equalTo(contentView.snp.top).offset(5)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.leading.equalTo(hamburgerMenuButton.snp.trailing).offset(30)
            make.top.equalTo(deliveryLabel.snp.bottom).offset(4)
        }
        
        dropDownListButton.snp.makeConstraints { make in
            make.leading.equalTo(addressLabel.snp.trailing).offset(5)
            make.top.equalTo(deliveryLabel.snp.bottom).offset(4)
        }
    }
}
