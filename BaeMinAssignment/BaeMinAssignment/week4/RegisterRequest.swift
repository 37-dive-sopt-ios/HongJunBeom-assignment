//
//  RegisterRequest.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/20/25.
//

import Foundation

/// 유저 등록 API (회원가입)
struct RegisterRequest: Encodable {
    let username: String
    let password: String
    let name: String
    let email: String
    let age: Int
}
