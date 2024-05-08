//
//  PromotionalGoodsDataSourse.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 06.05.2024.
//

import Foundation
import UIKit

struct PromotionalGoodsSectionModel {
    let image: UIImage?
    let description: String?
    let discount: String?
    let dishWeight: String?
    let priceWithoutDiscount: String?
    let discountedPricceLabel: String?
    let newDishBannerLabel: String?
    let newDish: Bool?
    
    static func fetchPromotionalGoodsSection() -> [PromotionalGoodsSectionModel] {
        let firstItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods1"), description: "Черные спагетти с морепродуктами (большая порция)", discount: "-35%", dishWeight: "230 г", priceWithoutDiscount: "486 ₽", discountedPricceLabel: "360 ₽", newDishBannerLabel: "Новинка", newDish: true)
        let secondItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods2"), description: "Казаречче с индейкой и томатами", discount: "-25%", dishWeight: "230 г", priceWithoutDiscount: "360 ₽", discountedPricceLabel: "200 ₽", newDishBannerLabel: "Новинка", newDish: false)
        let thirdItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods3"), description: "Равиоли с грибами", discount: "-35%", dishWeight: "230 г", priceWithoutDiscount: "1360 ₽", discountedPricceLabel: "1200 ₽", newDishBannerLabel: "Новинка", newDish: false)
        let fourthItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods4"), description: "Черные спагетти с морепродуктами (большая порция)", discount: "-25%", dishWeight: "230 г", priceWithoutDiscount: "486 ₽", discountedPricceLabel: "360 ₽", newDishBannerLabel: "Новинка", newDish: true)
        let fifthItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods5"), description: "Казаречче с индейкой и томатами", discount: "-35%", dishWeight: "230 г", priceWithoutDiscount: "360 ₽", discountedPricceLabel: "200 ₽", newDishBannerLabel: "Новинка", newDish: false)
        let sixthItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods6"), description: "Равиоли с грибами", discount: "-25%", dishWeight: "230 г", priceWithoutDiscount: "1360 ₽", discountedPricceLabel: "1200 ₽", newDishBannerLabel: "Новинка", newDish: false)
        let seventhItem = PromotionalGoodsSectionModel(image: UIImage(named: "goods7"), description: "Черные спагетти с морепродуктами (большая порция)", discount: "-35%", dishWeight: "230 г", priceWithoutDiscount: "486 ₽", discountedPricceLabel: "360 ₽", newDishBannerLabel: "Новинка", newDish: true)

        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem]
    }
    
}
