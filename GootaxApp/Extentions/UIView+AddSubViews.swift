//
//  UIView+AddSubViews.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 08.05.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addSubview($0)
        }
    }
}
