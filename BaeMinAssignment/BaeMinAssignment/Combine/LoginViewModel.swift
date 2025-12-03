//
//  LoginViewModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 12/3/25.
//

import Combine
import UIKit

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

final class LoginViewModel: ViewModelType {
    
    // MARK: - Input
    
    struct Input {
        let emailText: AnyPublisher<String, Never>
        let passwordText: AnyPublisher<String, Never>
        let loginButtonTapped: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    
    struct Output {
        let isLoginButtonEnabled: AnyPublisher<Bool, Never>
        let loginResult: AnyPublisher<LoginResult, Never>
    }
    
    enum LoginResult {
        case success(email: String)
        case failure(error: LoginError)
    }
    
    enum LoginError {
        case invalidEmail
        case invalidPassword
        case invalidBoth
        
        var message: (title: String, description: String?) {
            switch self {
            case .invalidEmail:
                return ("이메일 형식에 맞지 않습니다", nil)
            case .invalidPassword:
                return ("비밀번호 형식에 맞지 않습니다", "영문, 숫자, 특수문자를 포함하여 8자 이상 입력하세요.")
            case .invalidBoth:
                return ("이메일/비밀번호 형식에 맞지 않습니다", nil)
            }
        }
    }
    
    // MARK: - Properties
    
    private var currentEmail = ""
    private var currentPassword = ""
    
    // MARK: - Transform
    
    func transform(input: Input) -> Output {
        
        let emailInput = input.emailText
            .handleEvents(receiveOutput: { [weak self] email in
                self?.currentEmail = email
            })
            .eraseToAnyPublisher()
        
        let passwordInput = input.passwordText
            .handleEvents(receiveOutput: { [weak self] password in
                self?.currentPassword = password
            })
            .eraseToAnyPublisher()
        
        let isEmailNotEmpty = emailInput
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isPasswordNotEmpty = passwordInput
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isLoginButtonEnabled = Publishers.CombineLatest(
            isEmailNotEmpty,
            isPasswordNotEmpty
        )
            .map { $0 && $1 }
            .removeDuplicates()
            .eraseToAnyPublisher()
        
        let loginResult = input.loginButtonTapped
            .map { [weak self] _ -> LoginResult in
                guard let self = self else {
                    return .failure(error: .invalidBoth)
                }
                
                let email = self.currentEmail
                let password = self.currentPassword
                
                let isEmailValid = self.isValidEmail(email: email)
                let isPasswordValid = self.isValidPassword(password: password)
                
                switch (isEmailValid, isPasswordValid) {
                case (true, true):
                    return .success(email: email)
                case (true, false):
                    return .failure(error: .invalidPassword)
                case (false, true):
                    return .failure(error: .invalidEmail)
                case (false, false):
                    return .failure(error: .invalidBoth)
                }
            }
            .eraseToAnyPublisher()
        
        return Output(
            isLoginButtonEnabled: isLoginButtonEnabled,
            loginResult: loginResult
        )
    }
    
    // MARK: - Validation
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(password: String) -> Bool {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordPattern)
        return passwordPredicate.evaluate(with: password)
    }
}
