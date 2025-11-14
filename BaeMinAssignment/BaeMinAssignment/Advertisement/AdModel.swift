//
//  AdModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

public struct AdModel {
    public let itemImage: UIImage
    
    public init(itemImage: UIImage) {
        self.itemImage = itemImage
    }
    
    public static let mockData: [AdModel] = [
        AdModel(itemImage:  .ad1),
        AdModel(itemImage:  .ad2),
        AdModel(itemImage:  .ad3),
        AdModel(itemImage:  .ad4),
        AdModel(itemImage:  .ad5),
        AdModel(itemImage:  .ad1),
        AdModel(itemImage:  .ad2)
    ]
}

