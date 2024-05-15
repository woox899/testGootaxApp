//
//  ProfileSettingsViewController.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 09.05.2024.
//

import UIKit
import SnapKit

final class ProfileSettingsViewController: UIViewController {
    
    private let viewModel: ProfileSettingsViewModelProtocol
    
    private var dataSourse: [MenuActions] = [.payment, .myAddresses, .myOrders, .favorites, .news, .coupons, .aboutAu, .inviteFriends, .settings]

    private let topView: UIView = {
        let topView = UIView()
        return topView
    }()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .gray
        return separatorView
    }()
    
    private lazy var profileSettingsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.register(ProfileSettingsTableViewCell.self, forCellReuseIdentifier: ProfileSettingsTableViewCell.reuseID)
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "smileFace")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 28
        return avatarImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.text = "Иван Иванов"
        return nameLabel
    }()
    
    private let phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.font = .systemFont(ofSize: 16)
        phoneNumberLabel.text = "+7 912 011 11 33"
        return phoneNumberLabel
    }()
    
    private let connectWithUsImage: UIImageView = {
        let connectWithUsImage = UIImageView()
        connectWithUsImage.image = UIImage(named: "connectWithUsImage")
        return connectWithUsImage
    }()
    
    private let connectWithUsLabel: UILabel = {
        let connectWithUsLabel = UILabel()
        connectWithUsLabel.text = "Связаться с нами"
        connectWithUsLabel.font = .systemFont(ofSize: 16, weight: .light)
        connectWithUsLabel.numberOfLines = 2
        connectWithUsLabel.lineBreakMode = .byWordWrapping
        return connectWithUsLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    init(viewModel: ProfileSettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.addSubviews([topView, profileSettingsTableView, connectWithUsImage, connectWithUsLabel])
        topView.addSubviews([separatorView, avatarImageView, nameLabel, phoneNumberLabel])
        
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(107)
            make.top.equalToSuperview().offset(15)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(35)
            make.width.height.equalTo(56)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(32)
            make.top.equalToSuperview().offset(40)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(32)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(1)
            make.trailing.equalToSuperview().offset(-1)
            make.height.equalTo(1)
        }
        
        profileSettingsTableView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        connectWithUsImage.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(16)
            make.top.equalTo(profileSettingsTableView.snp.bottom).offset(-100)
        }
        
        connectWithUsLabel.snp.makeConstraints { make in
            make.leading.equalTo(connectWithUsImage.snp.trailing).offset(15)
            make.centerY.equalTo(connectWithUsImage.snp.centerY)
            make.trailing.equalTo(connectWithUsImage.snp.trailing).offset(100)
        }
    }
}

extension ProfileSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            return 40
        }
    }
}

extension ProfileSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = profileSettingsTableView.dequeueReusableCell(withIdentifier: ProfileSettingsTableViewCell.reuseID, for: indexPath) as? ProfileSettingsTableViewCell else { return UITableViewCell() }
        cell.configure(model: dataSourse[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

