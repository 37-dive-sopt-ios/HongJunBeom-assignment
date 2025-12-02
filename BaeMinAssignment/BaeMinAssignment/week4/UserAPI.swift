//
//  UserAPI.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/20/25.
//

import Foundation

/// User 관련 API 엔드포인트
/// Moya의 TargetType 과 비슷하게 구현함
enum UserAPI { //회원가입, 로그인 api추가?
    case register(RegisterRequest)           // POST /api/v1/users - 회원가입
    case login(LoginRequest)                 // POST /api/v1/auth/login - 로그인
    case getUser(id: Int)
    case updateUser(id: Int, request: UpdateUserRequest)
    case deleteUser(id: Int)
}

//enum Environment {
////  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String 앱잼할 때 쓸거
//  static let baseURL: String = "http://15.164.129.239"
//}


extension UserAPI: TargetType {
    
    /// 기본 URL
    public var baseURL: String {
        // SOPT 세미나 서버 URL (4주차 임시 개방)
        // TODO: 실제 배포 시에는 xcconfig 파일이나 환경 변수로 관리하세요
        //        return "http://15.164.129.239"
        return Environment.baseURL
    }
    
    /// API 경로
    public var path: String {
        switch self {
        case .register:
            return "/api/v1/users"
        case .login:
            return "/api/v1/auth/login"
        case .getUser(let id):
            return "/api/v1/users/\(id)"
        case .updateUser(let id, _):
            return "/api/v1/users/\(id)"
        case .deleteUser(let id):
            return "/api/v1/users/\(id)"
        }
    }
    
    /// The HTTP method used in the request.
    public var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        case .getUser:
            return .get
        case .updateUser:
            return .patch
        case .deleteUser:
            return .delete
        }
    }
    
    /// The type of HTTP task to be performed.
    public var task: HTTPTask { //바디로 들어가는애
        switch self {
        case .register(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestJSONEncodable(request)
            
        case .login(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestJSONEncodable(request)
            
        case .getUser:
            return .requestPlain
        case .updateUser(_, let request):
            return .requestJSONEncodable(request)
        case .deleteUser:
            return .requestPlain
        }
    }
    
    /// 헤더 (Moya와 동일 - 필요시 오버라이드)
    public var headers: [String: String]? { //이미 익스텐션을 해놔서 없어도 됨?
        // Content-Type은 Task에서 자동 설정되므로 여기서는 nil 반환
        return nil
    }
}

// MARK: - Convenience Methods

extension UserAPI {
    /// 회원가입 API 요청 헬퍼
    public static func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse { //저 파라미터 (리퀘스트 바디)를 넣어주면 UserResponse가 온다
        let request = RegisterRequest(
            username: username,
            password: password,
            name: name,
            email: email,
            age: age
        )
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.register(request)) //enum 에서 구현했던 함수
        guard let data = response.data else { //response.data 는 baseResopnse 에서 우리가 data를 만들어놓음(스위프트가 주는게 아님) 실질적으로 거기서 다 받아옴
            throw NetworkError.noData
        }
        
        return data
    }
    
    /// 로그인 API 요청 헬퍼
    public static func performLogin(
        username: String,
        password: String,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> LoginResponse {
        let request = LoginRequest(username: username, password: password)
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<LoginResponse> = try await provider.request(UserAPI.login(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    public static func performGetUser(
        id: Int,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.getUser(id: id))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    public static func performUpdateUser(
        id: Int,
        name: String? = nil,
        email: String? = nil,
        age: Int? = nil,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let request = UpdateUserRequest(name: name, email: email, age: age)
        
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.updateUser(id: id, request: request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    public static func performDeleteUser(id: Int, provider: NetworkProviding = NetworkProvider()) async throws -> EmptyResponse {
        let response: BaseResponse<EmptyResponse> = try await
        provider.request(UserAPI.deleteUser(id: id))
        
        guard let data = response.data else {
            return EmptyResponse()
        }
        return data
    }
}
