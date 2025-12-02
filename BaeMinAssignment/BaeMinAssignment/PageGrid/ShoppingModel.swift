//
//  ShoppingModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/12/25.
//

import UIKit

class ShoppingModel {
    public let itemImage: UIImage
    public let name: String

    public init(itemImage: UIImage, name: String) {
        self.itemImage = itemImage
        self.name = name
    }

    public static let mockData: [ShoppingModel] = [
        ShoppingModel(itemImage: .salad, name: "B마트"),
        ShoppingModel(itemImage: .shrimp, name: "슈퍼키친"),
        ShoppingModel(itemImage: .spaghetti, name: "마트"),
        ShoppingModel(itemImage: .chicken, name: "삼성스토어"),
        ShoppingModel(itemImage: .pizza, name: "편의점"),
        ShoppingModel(itemImage: .shrimp, name: "플로라운지"),
        ShoppingModel(itemImage: .spaghetti, name: "디지털"),
        ShoppingModel(itemImage: .jjajangmyeon, name: "현덕정육점"),
        ShoppingModel(itemImage: .burger, name: "지금술픽"),
        ShoppingModel(itemImage: .coffee, name: "전국특가"),
    ]
}


