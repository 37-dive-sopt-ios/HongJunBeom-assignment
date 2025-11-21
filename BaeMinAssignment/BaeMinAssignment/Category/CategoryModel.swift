//
//  CategoryModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

public struct CategoryModel {
    public let categoryName: String
    public var isSelected: Bool
    
    public init(categoryName: String, isSelected: Bool) {
        self.categoryName = categoryName
        self.isSelected = false
    }
    
    public static let mockData: [CategoryModel] = [
        CategoryModel(categoryName: "음식배달", isSelected: false),
        CategoryModel(categoryName: "픽업", isSelected: false),
        CategoryModel(categoryName: "장보기·쇼핑", isSelected: false),
        CategoryModel(categoryName: "선물하기", isSelected: false),
        CategoryModel(categoryName: "혜택모아보기", isSelected: false)
    ]
}
