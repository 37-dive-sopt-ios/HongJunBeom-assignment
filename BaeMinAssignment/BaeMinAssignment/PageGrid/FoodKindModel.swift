//
//  FoodKindModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

public struct FoodKindModel {
    public let itemImage: UIImage
    public let name: String
    
    public init(itemImage: UIImage, name: String) {
        self.itemImage = itemImage
        self.name = name
    }
    
    public static let mockData: [FoodKindModel] = [
        FoodKindModel(itemImage: .bibimbap, name: "한그릇"),
        FoodKindModel(itemImage: .shrimp, name: "고기"),
        FoodKindModel(itemImage: .chicken, name: "치킨"),
        FoodKindModel(itemImage: .chicken, name: "찜탕"),
        FoodKindModel(itemImage: .jjajangmyeon, name: "중식"),
        FoodKindModel(itemImage: .spaghetti, name: "양식"),
        FoodKindModel(itemImage: .pizza, name: "피자"),
        FoodKindModel(itemImage: .burger, name: "패스트푸드"),
        FoodKindModel(itemImage: .tteokbokki, name: "분식"),
        FoodKindModel(itemImage: .salad, name: "픽업"),
    ]
}
