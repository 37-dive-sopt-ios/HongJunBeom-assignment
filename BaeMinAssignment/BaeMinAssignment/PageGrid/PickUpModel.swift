//
//  PickUpModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

public struct PickUpModel {
    public let itemImage: UIImage
    public let name: String
    
    public init(itemImage: UIImage, name: String) {
        self.itemImage = itemImage
        self.name = name
    }
    
    public static let mockData: [PickUpModel] = [
        PickUpModel(itemImage: .salad, name: "픽업"),
        PickUpModel(itemImage: .shrimp, name: "지도"),
        PickUpModel(itemImage: .spaghetti, name: "카페·디저트"),
        PickUpModel(itemImage: .spoon, name: "식사"),
        PickUpModel(itemImage: .coffee, name: "빽다방"),
        PickUpModel(itemImage: .coffee, name: "스타벅스"),
        PickUpModel(itemImage: .coffee, name: "투썸플레이스"),
        PickUpModel(itemImage: .coffee, name: "커피빈"),
        PickUpModel(itemImage: .coffee, name: "할리스"),
        PickUpModel(itemImage: .coffee, name: "커피"),
    ]
}
