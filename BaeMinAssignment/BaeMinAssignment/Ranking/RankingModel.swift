//
//  RankingModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

public struct RankingModel {
    public let rankingImage: UIImage
    public let storeName: String
    public let starLabel: String
    public let reviewCount: String
    public let menu: String
    public let dc: String
    public let price: String
    public let beforePrice: String
    
    init(rankingImage: UIImage, storeName: String, starLabel: String ,reviewCount: String, menu: String, dc: String, price: String, beforePrice: String) {
        self.rankingImage = rankingImage
        self.storeName = storeName
        self.starLabel = starLabel
        self.reviewCount = reviewCount
        self.menu = menu
        self.dc = dc
        self.price = price
        self.beforePrice = beforePrice
    }
    
    public static let mockData: [RankingModel] = [
        RankingModel(rankingImage: .ranking1, storeName: "올데이파스타", starLabel: "5.0", reviewCount: "(2,275)", menu: "취향대로 셀프 한그릇 파스타", dc: "22%", price: "10,900원", beforePrice: "14,000원"),
        RankingModel(rankingImage: .ranking2, storeName: "판다파스타", starLabel: "5.0", reviewCount: "(4,376)", menu: "[NEW] 베이컨 투움바 파스타", dc: "20%", price: "11,100원", beforePrice: "13,900원"),
        RankingModel(rankingImage: .ranking3, storeName: "와떠마라탕", starLabel: "4.9", reviewCount: "(3,604)", menu: "와떠마라반(마라비빔)", dc: "20%", price: "12,000원", beforePrice: "15,000원"),
        RankingModel(rankingImage: .ranking4, storeName: "판다파스타", starLabel: "4.9", reviewCount: "(4,376)", menu: "내맘대로 한그릇 파스타", dc: "22%", price: "10,900원", beforePrice: "14,000원")
    ]
}
