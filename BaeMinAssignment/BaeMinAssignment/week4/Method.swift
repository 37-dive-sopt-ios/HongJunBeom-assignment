//
//  Method.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/20/25.
//

import Foundation

/// HTTP 메서드 (Moya의 Method와 동일!)
enum HTTPMethod: String { //이런게 서드파티에 구현이 되어있긴하지만 일단 알아야하기 때문에!
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
