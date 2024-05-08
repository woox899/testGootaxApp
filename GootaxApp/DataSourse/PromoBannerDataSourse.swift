//
//  PromoBannerDataSourse.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 06.05.2024.
//

import Foundation
import UIKit

struct PromoBannerModel {
    let image: UIImage?
    let descriptionFirstLabel: String?
    let descriptionSecondLabel: String?
    
    static func fetchPromoBanner() -> [PromoBannerModel] {
        let firstItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let secondItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let thirdItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let fourthItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let fifthItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let sixthItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")
        let seventhItem = PromoBannerModel(image: UIImage(named: "banner1"), descriptionFirstLabel: "В честь открытия", descriptionSecondLabel: "Скидки 20%")

        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem]
    }
    
}
