//
//  ProfileSettingsDataSourse.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 12.05.2024.
//

import UIKit

enum MenuActions {
    case payment
    case myAddresses
    case myOrders
    case favorites
    case news
    case coupons
    case aboutAu
    case inviteFriends
    case settings
    
    var title: String {
        switch self {
        case .payment:
            return "Оплата"
        case .myAddresses:
            return "Мои адреса"
        case .myOrders:
            return "Мои заказы"
        case .favorites:
            return "Избранное"
        case .news:
            return "Новости"
        case .coupons:
            return "Купоны"
        case .aboutAu:
            return "О нас"
        case .inviteFriends:
            return "Пригласить друзей"
        case .settings:
            return "Настройки"
        }
    }
    
    var subtitile: String {
        switch self {
        case .payment:
            return "Карта *4567"
        case .myAddresses:
            return ""
        case .myOrders:
            return ""
        case .favorites:
            return ""
        case .news:
            return ""
        case .coupons:
            return ""
        case .aboutAu:
            return ""
        case .inviteFriends:
            return ""
        case .settings:
            return ""
        }
    }
}
