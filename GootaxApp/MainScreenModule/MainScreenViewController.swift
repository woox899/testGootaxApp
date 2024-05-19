//
//  MainScreenViewController.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 03.05.2024.
//

import UIKit
import SideMenu

enum SectionType {
    case first
}

enum RowType {
    case address
    case search
    case promoSection
    case promoBanner
    case promotional
    case catalog
}

struct Section {
    let section: SectionType
    let rows: [RowType]
}

final class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sections: [Section] = [.init(section: SectionType.first, rows: [.address, .search, .promoSection, .promoBanner, .promotional, .catalog])]
  
    private var adress: String = "Выберете адрес"
    
    private lazy var listTabelView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[0].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell {
            switch sections[indexPath.section].rows[indexPath.row] {
            case .address:
                guard let addressSelectionTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: AddressSelectionTableViewCell.reuseID, for: indexPath) as? AddressSelectionTableViewCell else { return UITableViewCell() }
                addressSelectionTableViewCell.selectionStyle = .none
                addressSelectionTableViewCell.configure(adress: adress)
                addressSelectionTableViewCell.onTapToProfileSettingsVC = { [weak self] in
                    guard let self else {
                        return
                    }
                    let vc = ProfileSettingsViewController()
                    let menu = SideMenuNavigationController(rootViewController: vc)
                    menu.menuWidth = self.view.bounds.width * 0.9
                    menu.leftSide = true
                    self.present(menu, animated: true, completion: nil)
                }
                addressSelectionTableViewCell.onTapToAdressVC = { [weak self] in
                    guard let self else {
                        return
                    }
                    self.displaySearch()
                }
                return addressSelectionTableViewCell
                
            case .search:
                guard let searchTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseID, for: indexPath) as?
                        SearchTableViewCell else { return UITableViewCell() }
                searchTableViewCell.selectionStyle = .none
                return searchTableViewCell
                
            case .promoSection:
                guard let promoSectionTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromoSectionTableViewCell.reuseID, for: indexPath) as?
                        PromoSectionTableViewCell else { return UITableViewCell() }
                promoSectionTableViewCell.selectionStyle = .none
                return promoSectionTableViewCell
                
            case .promoBanner:
                guard let promoBannerTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromoBannerTableViewCell.reuseID, for: indexPath) as?
                        PromoBannerTableViewCell else { return UITableViewCell() }
                promoBannerTableViewCell.selectionStyle = .none
                return promoBannerTableViewCell
                
            case .promotional:
                guard let promotionalGoodsTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: PromotionalGoodsTableViewCell.reuseID, for: indexPath) as? PromotionalGoodsTableViewCell else { return UITableViewCell() }
                promotionalGoodsTableViewCell.selectionStyle = .none
                return promotionalGoodsTableViewCell
                
            case .catalog:
                guard let catalogTableViewCell = listTabelView.dequeueReusableCell(withIdentifier: CatalogTableViewCell.reuseID, for: indexPath) as?
                        CatalogTableViewCell else { return UITableViewCell() }
                catalogTableViewCell.selectionStyle = .none
                return catalogTableViewCell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .address:
            return 50
        case .search:
            return 50
        case .promoSection:
            return 108
        case .promoBanner:
            return 135
        case .promotional:
            return 280
        case .catalog:
            return 600
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .address:
            print("Строка с адресом")
        case .search:
            print("Поисковая строка")
        default:
            return
        }
    }

    private func setupUI() {
        view.addSubview(listTabelView)
        
        listTabelView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func displaySearch() {
        let viewModel: SearchAddressViewModelProtocol = SearchAddressViewModel()
        let vc = SearchAddressViewController(viewModel: viewModel)
        vc.addressSelected = { [weak self] adress in
            if let value = adress.value {
                self?.adress = value
                self?.listTabelView.reloadData()
            }
        }
        self.present(vc, animated: true)
    }
}
