//
//  NetworkManager.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 13.05.2024.
//

import UIKit
import Alamofire

class NetworkManager {
    func getLocation(searchText: String, completion: @escaping (Result<SearchAddressModel, Error>) -> Void) {
        let url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
        let params: Parameters = [
            "token" : "181451c77e40ed430e9237bf8d950d92175aadc0",
            "query" : searchText
        ]
        AF.request(url, method: .get, parameters: params).responseData { response in
            if let error = response.error {
                completion(.failure(error))
            } else {
                if let data = response.data,
                   let responseData = try? JSONDecoder().decode(SearchAddressModel.self, from: data) {
                    completion(.success(responseData))
                }
            }
        }
    }
}

