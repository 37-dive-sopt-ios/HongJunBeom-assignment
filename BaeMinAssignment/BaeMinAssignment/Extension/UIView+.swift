//
//  UIView+.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
            views.forEach { self.addSubview($0) }
        }
}
