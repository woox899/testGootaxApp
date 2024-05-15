//
//  ProfileSettingsTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 12.05.2024.
//

import UIKit

class ProfileSettingsTableViewCell: UITableViewCell {
    
    var model: MenuActions?
    
    static let reuseID = "ProfileSettingsTableViewCell"

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 16)
        return titleLabel
    }()
    
    private let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = .systemFont(ofSize: 14, weight: .light)
        return subTitleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MenuActions) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subtitile
    }
    
    private func setupUI() {
        contentView.addSubviews([titleLabel, subTitleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
    }
}

