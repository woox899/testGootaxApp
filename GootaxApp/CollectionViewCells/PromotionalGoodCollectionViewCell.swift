//
//  PromotionalGoodCollectionViewCell.swift
//  GootaxApp
//
//  Created by Андрей Бабкин on 05.05.2024.
//

import UIKit
import SnapKit

final class PromotionalGoodsCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PromotionalGoodsCollectionViewCell"
    
    private var model: PromotionalGoodsSectionModel?
    
    private var quantityOfGoodsInCartNumber = 0
    
    private let promotionalGoodsSectionView: UIView = {
        let promotionalGoodsSectionView = UIView()
        promotionalGoodsSectionView.layer.cornerRadius = 12
        promotionalGoodsSectionView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        return promotionalGoodsSectionView
    }()
    
    private let promotionalGoodsSectionImageView: UIImageView = {
        let promotionalGoodsImageView = UIImageView()
        return promotionalGoodsImageView
    }()
    
    private let promotionalGoodsDescriptionLabel: UILabel = {
        let promotionalGoodsDescriptionLabel = UILabel()
        promotionalGoodsDescriptionLabel.font = .systemFont(ofSize: 12)
        promotionalGoodsDescriptionLabel.numberOfLines = 3
        promotionalGoodsDescriptionLabel.adjustsFontSizeToFitWidth = true
        promotionalGoodsDescriptionLabel.textAlignment = .left
        return promotionalGoodsDescriptionLabel
    }()
    
    private let discountBannerView: UIView = {
        let discountBannerView = UIView()
        discountBannerView.backgroundColor = .red
        discountBannerView.layer.cornerRadius = 8
        return discountBannerView
    }()
    
    private let discountBannerLabel: UILabel = {
        let discountBannerLabel = UILabel()
        discountBannerLabel.font = .systemFont(ofSize: 10)
        discountBannerLabel.textColor = .white
        return discountBannerLabel
    }()
    
    private let newDishBannerView: UIView = {
        let newDishBannerView = UIView()
        newDishBannerView.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 51/255, alpha: 1)
        newDishBannerView.layer.cornerRadius = 8
        return newDishBannerView
    }()
    
    private let newDishBannerLabel: UILabel = {
        let newDishBannerLabel = UILabel()
        newDishBannerLabel.font = .systemFont(ofSize: 10)
        newDishBannerLabel.textColor = .white
        return newDishBannerLabel
    }()
    
    private let dishWeightLabel: UILabel = {
        let dishWeightLabel = UILabel()
        dishWeightLabel.font = .systemFont(ofSize: 12, weight: .light)
        return dishWeightLabel
    }()

    private let pricePerDishLebel: UILabel = {
        let pricePerDishLebel = UILabel()
        pricePerDishLebel.font = .systemFont(ofSize: 12, weight: .light)
        return pricePerDishLebel
    }()
    
    private let priceWithoutDiscountLabel: UILabel = {
        let priceWithoutDiscountLabel = UILabel()
        priceWithoutDiscountLabel.font = .systemFont(ofSize: 12)
        priceWithoutDiscountLabel.textColor = .red
        return priceWithoutDiscountLabel
    }()
    
    private let discountedPricceLabel: UILabel = {
        let discountedPricceLabel = UILabel()
        discountedPricceLabel.font = .systemFont(ofSize: 16)
        return discountedPricceLabel
    }()
    
    private lazy var addingAProductButton: UIButton = {
        let addingAProductButton = UIButton()
        addingAProductButton.layer.cornerRadius = 15
        addingAProductButton.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 52/255, alpha: 1)
        addingAProductButton.setImage(UIImage(named: "addButtonImage"), for: .normal)
        addingAProductButton.addTarget(self, action: #selector(quantityOfGoodsInCartPlus), for: .touchUpInside)
        return addingAProductButton
    }()
    
    private lazy var removeFromCartButton: UIButton = {
        let removeFromCartButton = UIButton()
        removeFromCartButton.layer.cornerRadius = 15
        removeFromCartButton.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 52/255, alpha: 1)
        removeFromCartButton.setImage(UIImage(named: "removeButtonImage"), for: .normal)
        removeFromCartButton.addTarget(self, action: #selector(quantityOfGoodsInCartMinus), for: .touchUpInside)
        return removeFromCartButton
    }()
    
    private let addingToCartView: UIView = {
        let addingToCartView = UIView()
        addingToCartView.layer.cornerRadius = 15
        addingToCartView.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 52/255, alpha: 1)
        return addingToCartView
    }()
    
    private let quantityOfGoodsInCartLabel: UILabel = {
        let quantityOfGoodsInCart = UILabel()
        quantityOfGoodsInCart.font = .systemFont(ofSize: 14)
        quantityOfGoodsInCart.textColor = .black
        return quantityOfGoodsInCart
    }()
    
    private let redLineView: UIView = {
        let redLineView = UIView()
        redLineView.backgroundColor = .red
        return redLineView
    }()

    override init(frame: CGRect) {
        super .init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func quantityOfGoodsInCartPlus() {
        quantityOfGoodsInCartNumber += 1
        addToCart()
    }
    
    @objc func quantityOfGoodsInCartMinus() {
        quantityOfGoodsInCartNumber -= 1
        addToCart()
    }
    
    func addToCart() {
        if quantityOfGoodsInCartNumber == 0 {
            discountedPricceLabel.isHidden = false
            priceWithoutDiscountLabel.isHidden = false
            addingToCartView.isHidden = true
            removeFromCartButton.isHidden = true
            quantityOfGoodsInCartLabel.isHidden = true
            pricePerDishLebel.isHidden = true
            redLineView.isHidden = false
            
        } else if quantityOfGoodsInCartNumber > 0 {
            discountedPricceLabel.isHidden = true
            priceWithoutDiscountLabel.isHidden = true
            addingToCartView.isHidden = false
            removeFromCartButton.isHidden = false
            quantityOfGoodsInCartLabel.isHidden = false
            pricePerDishLebel.isHidden = false
            redLineView.isHidden = true
        }
        quantityOfGoodsInCartLabel.text = String(quantityOfGoodsInCartNumber)
    }

    func configure(model: PromotionalGoodsSectionModel) {
        self.model = model
        promotionalGoodsSectionImageView.image = model.image
        promotionalGoodsDescriptionLabel.text = model.description
        discountBannerLabel.text = model.discount
        dishWeightLabel.text = model.dishWeight
        discountedPricceLabel.text = model.discountedPricceLabel
        priceWithoutDiscountLabel.text = model.priceWithoutDiscount
        newDishBannerLabel.text = model.newDishBannerLabel
        pricePerDishLebel.text = model.discountedPricceLabel
        
        if model.newDish == false {
            newDishBannerView.isHidden = true
        }
        addingToCartView.isHidden = true
        removeFromCartButton.isHidden = true
        quantityOfGoodsInCartLabel.isHidden = true
        pricePerDishLebel.isHidden = true
        redLineView.isHidden = false
    }
    
    private func setupUI() {
        addSubview(promotionalGoodsSectionView)
        promotionalGoodsSectionView.addSubview(promotionalGoodsSectionImageView)
        promotionalGoodsSectionView.addSubview(promotionalGoodsDescriptionLabel)
        promotionalGoodsSectionView.addSubview(dishWeightLabel)
        promotionalGoodsSectionView.addSubview(discountBannerView)
        promotionalGoodsSectionView.addSubview(discountedPricceLabel)
        promotionalGoodsSectionView.addSubview(priceWithoutDiscountLabel)
        promotionalGoodsSectionView.addSubview(addingToCartView)
        promotionalGoodsSectionView.addSubview(addingAProductButton)
        promotionalGoodsSectionView.addSubview(removeFromCartButton)
        promotionalGoodsSectionView.addSubview(newDishBannerView)
        promotionalGoodsSectionView.addSubview(pricePerDishLebel)
        addingToCartView.addSubview(quantityOfGoodsInCartLabel)
        newDishBannerView.addSubview(newDishBannerLabel)
        discountBannerView.addSubview(discountBannerLabel)
        promotionalGoodsSectionView.addSubview(redLineView)

        promotionalGoodsSectionView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
        
        promotionalGoodsSectionImageView.snp.makeConstraints { make in
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading)
            make.top.equalTo(promotionalGoodsSectionView.snp.top)
            make.trailing.equalTo(promotionalGoodsSectionView.snp.trailing)
        }
        
        promotionalGoodsDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(promotionalGoodsSectionImageView.snp.bottom).offset(5)
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
            make.trailing.equalTo(promotionalGoodsSectionView.snp.trailing).offset(-5)
        }
        
        dishWeightLabel.snp.makeConstraints { make in
            make.top.equalTo(promotionalGoodsDescriptionLabel.snp.bottom).offset(3)
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
        }
        
        pricePerDishLebel.snp.makeConstraints { make in
            make.top.equalTo(promotionalGoodsDescriptionLabel.snp.bottom).offset(3)
            make.leading.equalTo(dishWeightLabel.snp.trailing).offset(5)
        }
        
        discountBannerView.snp.makeConstraints { make in
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
            make.top.equalTo(promotionalGoodsSectionView.snp.top).offset(5)
            make.width.equalTo(38)
            make.height.equalTo(15)
        }
        
        discountBannerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(discountBannerView.snp.centerX)
            make.centerY.equalTo(discountBannerView.snp.centerY)
        }
        
        discountedPricceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(promotionalGoodsSectionView.snp.bottom).offset(-5)
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
        }
        
        priceWithoutDiscountLabel.snp.makeConstraints { make in
            make.bottom.equalTo(discountedPricceLabel.snp.top)
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
        }
        
        addingAProductButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(promotionalGoodsSectionView.snp.bottom).offset(-5)
            make.trailing.equalTo(promotionalGoodsSectionView.snp.trailing).offset(-5)
        }
        
        removeFromCartButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(promotionalGoodsSectionView.snp.bottom).offset(-5)
            make.leading.equalTo(promotionalGoodsSectionView.snp.leading).offset(5)
        }
        
        newDishBannerView.snp.makeConstraints { make in
            make.trailing.equalTo(promotionalGoodsSectionView.snp.trailing).offset(-5)
            make.top.equalTo(promotionalGoodsSectionView.snp.top).offset(5)
            make.width.equalTo(49)
            make.height.equalTo(15)
        }
        
        newDishBannerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(newDishBannerView.snp.centerX)
            make.centerY.equalTo(newDishBannerView.snp.centerY)
        }
        
        addingToCartView.snp.makeConstraints { make in
            make.leading.equalTo(removeFromCartButton.snp.leading)
            make.trailing.equalTo(addingAProductButton.snp.trailing)
            make.height.equalTo(30)
            make.bottom.equalTo(promotionalGoodsSectionView.snp.bottom).offset(-5)
        }
        
        quantityOfGoodsInCartLabel.snp.makeConstraints { make in
            make.center.equalTo(addingToCartView.snp.center)
        }
        
        redLineView.snp.makeConstraints { make in
            make.centerY.equalTo(priceWithoutDiscountLabel.snp.centerY)
            make.leading.equalTo(priceWithoutDiscountLabel.snp.leading)
            make.trailing.equalTo(priceWithoutDiscountLabel.snp.trailing)
            make.height.equalTo(1)
        }
    }
}


