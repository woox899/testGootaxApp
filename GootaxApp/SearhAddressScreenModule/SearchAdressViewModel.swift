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
    private var timer: Timer?
    private var query: String = String()
    private let networkManager = NetworkManager()
    
    func getLocation(text: String) {
        query = text
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(findAdress), userInfo: nil, repeats: false)
    }
    
    @objc private func findAdress() {
        self.networkManager.getLocation(searchText: query) { [weak self] result in
            switch result {
            case .success(let model):
                self?.delegate?.displayAddresses(model: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
