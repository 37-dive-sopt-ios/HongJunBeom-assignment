//
//  SeeMoreModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

public class SeeMoreModel {
    public let title: String
    
    init(title: String) {
        self.title = title
    }
    
    public static let mockData: [SeeMoreModel] = [
        SeeMoreModel(title: "음식배달에서 더보기 >"),
        SeeMoreModel(title: "픽업에서 더보기 >"),
        SeeMoreModel(title: "장보기·쇼핑에서 더보기 >"),
        SeeMoreModel(title: "선물하기에서 더보기 >"),
        SeeMoreModel(title: "혜택모아보기에서 더보기 >")
        ]
}
