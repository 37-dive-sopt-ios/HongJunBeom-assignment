//
//  UITextFiedl+.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/23/25.
//

import Foundation
import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func addRightPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
