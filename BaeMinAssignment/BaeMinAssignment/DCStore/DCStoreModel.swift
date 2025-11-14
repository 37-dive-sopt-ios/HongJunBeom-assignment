//
//  DCStoreModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

class DCStoreModel {
    public let DCStoreImage: UIImage
    public let storeName: String
    public let starCount: String
    public let reviewCount: String
    public let deliveryTime: String
    public let deliveryFee: String
    
    init(DCStoreImage: UIImage, storeName: String, starCount: String, reviewCount: String, deliveryTime: String, deliveryFee: String) {
        self.DCStoreImage = DCStoreImage
        self.storeName = storeName
        self.starCount = starCount
        self.reviewCount = reviewCount
        self.deliveryTime = deliveryTime
        self.deliveryFee = deliveryFee
    }
    
    public static let mockData: [DCStoreModel] = [
        DCStoreModel(DCStoreImage: .recent4, storeName: "제육고집 신림본점", starCount: "5.0", reviewCount: "(2,851)", deliveryTime: "31~46분", deliveryFee: "무료배달"),
        DCStoreModel(DCStoreImage: .recent3, storeName: "교촌치킨 회기점", starCount: "5.0", reviewCount: "(1,151)", deliveryTime: "20~36분", deliveryFee: "무료배달"),
        DCStoreModel(DCStoreImage: .recent2, storeName: "무주식당", starCount: "5.0", reviewCount: "(6,851)", deliveryTime: "31~46분", deliveryFee: "무료배달"),
        DCStoreModel(DCStoreImage: .recent1, storeName: "중계의 밤", starCount: "5.0", reviewCount: "(851)", deliveryTime: "50~58분", deliveryFee: "무료배달")
        ]
}
