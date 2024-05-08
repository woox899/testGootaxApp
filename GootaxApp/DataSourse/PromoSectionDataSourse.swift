//
//  PromoSectionDataSourse.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 06.05.2024.
//

import Foundation
import UIKit

struct PromoSectionModel {
    let image: UIImage?
    let description: String?
    
    static func fetchPromoSection() -> [PromoSectionModel] {
        let firstItem = PromoSectionModel(image: UIImage(named: "promo1"), description: "Летний пикник")
        let secondItem = PromoSectionModel(image: UIImage(named: "promo2"), description: "Летний обед")
        let thirdItem = PromoSectionModel(image: UIImage(named: "promo3"), description: "На завтрак")
        let fourthItem = PromoSectionModel(image: UIImage(named: "promo4"), description: "На ужин")
        let fifthItem = PromoSectionModel(image: UIImage(named: "promo5"), description: "Летний пикник")
        let sixthItem = PromoSectionModel(image: UIImage(named: "promo6"), description: "Летний обед")
        let seventhItem = PromoSectionModel(image: UIImage(named: "promo7"), description: "На завтрак")

        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem]
    }
    
}
