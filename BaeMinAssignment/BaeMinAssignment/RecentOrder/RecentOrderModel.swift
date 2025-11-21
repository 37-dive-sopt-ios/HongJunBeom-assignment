//
//  RecentOrderModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

class RecentOrderModel {
    public let recentOrderImage: UIImage
    public let recentCount: String
    public let storeName: String
    public let starCount: String
    public let deliveryTime: String
    public let deliveryFee: String
    
    init(recentOrderImage: UIImage, recentCount: String, storeName: String, starCount: String, deliveryTime: String, deliveryFee: String) {
        self.recentOrderImage = recentOrderImage
        self.recentCount = recentCount
        self.storeName = storeName
        self.starCount = starCount
        self.deliveryTime = deliveryTime
        self.deliveryFee = deliveryFee
    }
    
    public static let mockData: [RecentOrderModel] = [
        RecentOrderModel(recentOrderImage: .recent1, recentCount: "최근 1번 주문한 가게", storeName: "마포매운쌀떡볶이 회기점", starCount: "5.0", deliveryTime: "약 20분", deliveryFee: "무료배달"),
        RecentOrderModel(recentOrderImage: .recent2, recentCount: "최근 4번 주문한 가게", storeName: "서향", starCount: "4.9", deliveryTime: "약 51분", deliveryFee: "무료배달"),
        RecentOrderModel(recentOrderImage: .recent3, recentCount: "최근 3번 주문한 가게", storeName: "처갓집양념치킨 회기점", starCount: "5.0", deliveryTime: "약 39분", deliveryFee: "무료배달"),
        RecentOrderModel(recentOrderImage: .recent4, recentCount: "최근 2번 주문한 가게", storeName: "BBQ올떡볶이 외대점", starCount: "4.9", deliveryTime: "약 36분", deliveryFee: "무료배달")
    ]
}
