//
//  CatalogDataSourse.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 06.05.2024.
//

import UIKit

struct CatalogSectionModel {
    let backgroundImage: UIImage?
    let image: UIImage?
    let description: String?
    
    static func fetchCatalofSection() -> [CatalogSectionModel] {
        let firstItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack1"), image: UIImage(named: "catalogImage1"), description: "Наборы")
        let secondItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack2"), image: UIImage(named: "catalogImage2"), description: "Пицца")
        let thirdItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack3"), image: UIImage(named: "catalogImage3"), description: "Паста")
        let fourthItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack4"), image: UIImage(named: "catalogImage4"), description: "Ризотто")
        let fifthItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack5"), image: UIImage(named: "catalogImage5"), description: "Салаты")
        let sixthItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack6"), image: UIImage(named: "catalogImage6"), description: "Полу фабрикаты")
        let seventhItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack7"), image: UIImage(named: "catalogImage7"), description: "Десерты")
        let eighthItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack8"), image: UIImage(named: "catalogImage8"), description: "Добавки к блюдам")
        let ninthItem = CatalogSectionModel(backgroundImage: UIImage(named: "catalogBack9"), image: UIImage(named: "catalogImage9"), description: "Напитки")
        
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem, eighthItem, ninthItem]
    }
    
}
