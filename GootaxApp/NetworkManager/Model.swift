//
//  Model.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 14.05.2024.
//

import Foundation

struct SearchAddressModel: Codable {
    var suggestions: [Address]
}

struct Address: Codable {
    var value: String?
    var unrestrictedValue: String?
    
    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
    }
}
