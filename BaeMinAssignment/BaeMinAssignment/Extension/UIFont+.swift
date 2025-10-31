//
//  FontLiterals.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/31/25.
//

import Foundation
import UIKit

enum FontNames: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardExtraBold = "Pretendard-ExtraBold"
}

extension UIFont {
    static func font(_ style: FontNames, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}
