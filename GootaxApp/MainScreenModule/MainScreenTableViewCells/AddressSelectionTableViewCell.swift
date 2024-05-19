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
    
    var onTapToProfileSettingsVC: (() -> Void)?

    var onTapToAdressVC: (() -> Void)?
    
    private lazy var hamburgerMenuButton: UIButton = {
        let hamburgerMenuButton = UIButton()
        hamburgerMenuButton.setImage(UIImage(named: "hamburgerButtonImage"), for: .normal)
        hamburgerMenuButton.addTarget(self, action: #selector(goToProfileViewController), for: .touchUpInside)
        return hamburgerMenuButton
    }()
    
    private lazy var deliveryView: UIView = {
        let deliveryView = UIView()
        let tapToDeliveryLabel = UITapGestureRecognizer(target: self, action: #selector(goToSearchAdressViewController))
        deliveryView.isUserInteractionEnabled = true
        deliveryView.addGestureRecognizer(tapToDeliveryLabel)
        return deliveryView
    }()
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return deliveryLabel
    }()
    
    private let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.font = UIFont.systemFont(ofSize: 16)
        addressLabel.adjustsFontSizeToFitWidth = true
        return addressLabel
    }()

    private let dropDownListImageView: UIImageView = {
        let dropDownListImageView = UIImageView()
        dropDownListImageView.image = UIImage(named: "downArrow")
        return dropDownListImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(adress: String) {
        addressLabel.text = adress
    }
    
    @objc private func goToProfileViewController() {
        onTapToProfileSettingsVC?()
    }
    
    @objc private func goToSearchAdressViewController() {
        onTapToAdressVC?()
    }
    
    private func setupUI() {
        contentView.addSubviews([deliveryView, hamburgerMenuButton])
        deliveryView.addSubviews([deliveryLabel, addressLabel, dropDownListImageView])

        hamburgerMenuButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        
        deliveryView.snp.makeConstraints { make in
            make.leading.equalTo(hamburgerMenuButton.snp.trailing).offset(30)
            make.top.bottom.equalToSuperview()
        }
        
        deliveryLabel.snp.makeConstraints { make in
            make.leading.equalTo(deliveryView.snp.leading)
            make.top.equalToSuperview().offset(5)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.leading.equalTo(deliveryView.snp.leading)
            make.top.equalTo(deliveryLabel.snp.bottom).offset(4)
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width * 0.7)
        }
        
        dropDownListImageView.snp.makeConstraints { make in
            make.centerY.equalTo(addressLabel.snp.centerY)
            make.leading.equalTo(addressLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
    }
}
