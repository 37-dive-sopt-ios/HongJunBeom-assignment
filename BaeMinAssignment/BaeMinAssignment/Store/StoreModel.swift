//
//  StoreModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

public struct StoreModel {
    public let storeImage: UIImage
    public let storeName: String
    
    public init(storeImage: UIImage, storeName: String) {
        self.storeImage = storeImage
        self.storeName = storeName
    }
    
    public static let mockData: [StoreModel] = [
        StoreModel(storeImage: .CU, storeName: "B마트"),
        StoreModel(storeImage: .gs25, storeName: "이마트"),
        StoreModel(storeImage: .emart, storeName: "CU"),
        StoreModel(storeImage: .salad, storeName: "이마트슈퍼"),
        StoreModel(storeImage: .bibimbap, storeName: "GS25"),
        StoreModel(storeImage: .burger, storeName: "홈플러스"),
        StoreModel(storeImage: .chicken, storeName: "세븐일레븐"),
        StoreModel(storeImage: .CU, storeName: "JAJU"),
        StoreModel(storeImage: .jjajangmyeon, storeName: "홈플러스"),
    ]
}
