//
//  UILabel+.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
}
