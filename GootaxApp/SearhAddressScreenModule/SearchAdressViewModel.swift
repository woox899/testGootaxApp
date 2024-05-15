//
//  SearchAdressViewModel.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 12.05.2024.
//

import Foundation

protocol SearchAddressViewModelProtocol: AnyObject {
    func getLocation(text: String)
    var delegate: SearchAddressViewModelDelegate? { get set }
}

protocol SearchAddressViewModelDelegate: AnyObject {
    func displayAddresses(model: SearchAddressModel)
}

final class SearchAddressViewModel: SearchAddressViewModelProtocol {
    weak var delegate: SearchAddressViewModelDelegate?
    private let networkManager = NetworkManager()
    func getLocation(text: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.networkManager.getLocation(searchText: text) { [weak self] result in
                switch result {
                case .success(let model):
                    self?.delegate?.displayAddresses(model: model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
