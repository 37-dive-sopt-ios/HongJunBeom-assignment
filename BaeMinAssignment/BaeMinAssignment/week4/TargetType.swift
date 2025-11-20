//
//  TargetType.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/20/25.
//

import Foundation

/// HTTP Task를 정의하는 enum (Moya의 Task와 동일!)
public enum HTTPTask {
    /// 요청만 보냄 (바디 없음)
    case requestPlain

    /// JSON 인코딩된 파라미터를 바디에 포함
    case requestJSONEncodable(Encodable)

    /// 파라미터와 URL 인코딩 방식 지정
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

/// 파라미터 인코딩 방식 (Moya와 유사)
/// 실제 라이브러리를 뜯어보면 유사하게 되어있습니다.
public enum ParameterEncoding {
    case url
    case json
}

/// The protocol used to define the specifications necessary for a `MoyaProvider`.
/// (Moya의 TargetType과 완전히 동일!)
 protocol TargetType { //api 마다 들어갈거니까 프로토콜로
    /// The target's base `URL`.
    /// (교육용으로 String 사용, 실제 Moya는 URL 타입)
    var baseURL: String { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The type of HTTP task to be performed.
    var task: HTTPTask { get } //얘가 바디?

    /// The headers to be used in the request.
    var headers: [String: String]? { get } //있어도 되고 없어도 되니까 ? 기본은 nil
}

// MARK: - Default Implementation

 extension TargetType {
    /// 기본 헤더 (Moya의 default implementation과 동일)
    var headers: [String: String]? { //헤더는 있을수도없을수도 있어서 기본값을 구현한거 // 어쨌든 nil이라도 보내줘야함
        return nil
    }

    /// URLRequest 생성 (Task 기반으로 처리)
    func toURLRequest() throws -> URLRequest { // 이 함수에서 url 리퀘스트를 만들어준다고 생각하면됨
        // URL 생성
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        // 헤더 추가
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        // HTTPTask에 따라 바디 처리 (Moya와 동일한 방식!)
        switch task {
        case .requestPlain: //path 파라미터는 바디가 없다?
            // 바디 없음
            break

        case .requestJSONEncodable(let encodable):
            // JSON 인코딩
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                // Encodable을 JSON으로 인코딩하기 위한 헬퍼
                let encoder = JSONEncoder()
                request.httpBody = try encodable.encode(with: encoder)
            } catch {
                throw NetworkError.encodingFailed
            }

        case .requestParameters(let parameters, let encoding):
            // 파라미터 인코딩
            switch encoding {
            case .json:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)

            case .url:
                // URL 인코딩 (쿼리 파라미터)
                if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    urlComponents.queryItems = parameters.map {
                        URLQueryItem(name: $0.key, value: "\($0.value)")
                    }
                    print(urlComponents)
                    if let newURL = urlComponents.url {
                        request.url = newURL
                    }
                }
            }
        }

        return request
    }
     
    // ["id": 561] //이걸 바디에 넣으면 바로 파싱해준다? ?id=561 이런식으로
}

// MARK: - Encodable Helper

extension Encodable {
    /// Encodable을 Data로 인코딩하는 헬퍼 메서드
    fileprivate func encode(with encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
}
