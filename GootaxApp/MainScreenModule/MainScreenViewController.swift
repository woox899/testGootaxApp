//
//  MainScreenViewController.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit

final class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel: MainScreenViewModelProtocol

    private lazy var listTabelView: UITableView = {
        let view = UITableView(frame: view.bounds, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.register(AddressSelectionTableViewCell.self, forCellReuseIdentifier: AddressSelectionTableViewCell.reuseID)
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseID)
        view.register(PromoSectionTableViewCell.self, forCellReuseIdentifier: PromoSectionTableViewCell.reuseID)
        view.register(PromoBannerTableViewCell.self, forCellReuseIdentifier: PromoBannerTableViewCell.reuseID)
        view.register(PromotionalGoodsTableViewCell.self, forCellReuseIdentifier: PromotionalGoodsTableViewCell.reuseID)
        view.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.reuseID)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    init(viewModel: MainScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell {
            switch indexPath.row {
            case 0:
                guard let addressSelectionTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: AddressSelectionTableViewCell.reuseID, for: indexPath) as? AddressSelectionTableViewCell else { return UITableViewCell() }
                addressSelectionTableViewCell.selectionStyle = .none
                return addressSelectionTableViewCell
                
            case 1:
                guard let searchTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseID, for: indexPath) as?
                        SearchTableViewCell else { return UITableViewCell() }
                searchTableViewCell.selectionStyle = .none
                return searchTableViewCell
                
            case 2:
                guard let promoSectionTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromoSectionTableViewCell.reuseID, for: indexPath) as?
                        PromoSectionTableViewCell else { return UITableViewCell() }
                promoSectionTableViewCell.selectionStyle = .none
                return promoSectionTableViewCell
                
            case 3:
                guard let promoBannerTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromoBannerTableViewCell.reuseID, for: indexPath) as?
                        PromoBannerTableViewCell else { return UITableViewCell() }
                promoBannerTableViewCell.selectionStyle = .none
                return promoBannerTableViewCell
                
            case 4:
                guard let promotionalGoodsTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromotionalGoodsTableViewCell.reuseID, for: indexPath) as? PromotionalGoodsTableViewCell else { return UITableViewCell() }
                promotionalGoodsTableViewCell.selectionStyle = .none
                return promotionalGoodsTableViewCell
                
            case 5:
                guard let catalogTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: CatalogTableViewCell.reuseID, for: indexPath) as?
                        CatalogTableViewCell else { return UITableViewCell() }
                catalogTableViewCell.selectionStyle = .none
                return catalogTableViewCell
            default:
                return UITableViewCell()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 50
        case 1:
            return 50
        case 2:
            return 108
        case 3:
            return 135
        case 4:
            return 280
        case 5:
            return 600
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("Строка с адресом")
        case 1:
            print("Поисковая строка")
        default:
            print("Hello")
        }
    }

    func setupUI() {
        view.addSubview(listTabelView)
    }
}

