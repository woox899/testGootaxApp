//
//  SearchTableViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    static let reuseID = "SearchBarTableViewCell"
    
    private let searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.placeholder = "Поиск товаров"
        searchTextField.font = .systemFont(ofSize: 14)
        return searchTextField
    }()
    
    private let searchLikeButton: UIButton = {
        let searchLikeButton = UIButton()
        searchLikeButton.setImage(UIImage(named: "searchLikeButton"), for: .normal)
        return searchLikeButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubviews([searchTextField, searchLikeButton])
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(searchLikeButton.snp.leading).offset(-10)
            make.width.equalTo(35)
        }
        
        searchLikeButton.snp.makeConstraints { make in
            make.leading.equalTo(searchTextField.snp.trailing).offset(20)
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
    }
}
