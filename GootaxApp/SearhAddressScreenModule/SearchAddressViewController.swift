//
//  SearchAddressViewController.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 10.05.2024.
//

import UIKit
import SnapKit

final class SearchAddressViewController: UIViewController, UITextFieldDelegate, SearchAddressViewModelDelegate {
    
    var addressSelected: ((Address) -> Void)?

    private let viewModel: SearchAddressViewModelProtocol
    
    private var dataSourse = [SearchAddressTableViewCellModel]()
    
    private lazy var searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.borderStyle = .none
        searchTextField.delegate = self
        searchTextField.keyboardType = .default
        return searchTextField
    }()
    
    private lazy var searchAddressTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = .none
        view.register(SearchAddressTableViewCell.self, forCellReuseIdentifier: SearchAddressTableViewCell.reuseID)
        return view
    }()
    
    private let searchTextFieldBottomLine: UIView = {
        let searchTextFieldBottomLine = UIView()
        searchTextFieldBottomLine.backgroundColor = .gray
        return searchTextFieldBottomLine
    }()
    
    init(viewModel: SearchAddressViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemBackground
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return false }
        viewModel.getLocation(text: text)
        return true
    }

    func displayAddresses(model: SearchAddressModel) {
        dataSourse = model.suggestions.map { SearchAddressTableViewCellModel(type: .adress, adress: $0) }
        dataSourse.insert(SearchAddressTableViewCellModel(type: .myLocation, adress: Address(value: nil, unrestrictedValue: nil)), at: 0)
        searchAddressTableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubviews([searchTextField, searchAddressTableView, searchTextFieldBottomLine])
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(50)
        }
        
        searchAddressTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextFieldBottomLine.snp.bottom)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalToSuperview()
        }
        
        searchTextFieldBottomLine.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
    }
}

extension SearchAddressViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSourse[indexPath.row]
        addressSelected?(model.adress)
        dismiss(animated: true)
    }
}

extension SearchAddressViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchAddressTableView.dequeueReusableCell(withIdentifier: SearchAddressTableViewCell.reuseID, for: indexPath) as? SearchAddressTableViewCell
        else { return UITableViewCell() }
        cell.configure(model: dataSourse[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
