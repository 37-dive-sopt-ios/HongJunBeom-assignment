//
//  LoginViewController_Combine.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 12/3/25.
//

import UIKit
import Combine

final class LoginViewController_Combine: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = LoginView()
    private let viewModel = LoginViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // Input Subjects
    private let emailTextSubject = PassthroughSubject<String, Never>()
    private let passwordTextSubject = PassthroughSubject<String, Never>()
    private let loginButtonTappedSubject = PassthroughSubject<Void, Never>()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setupDelegates()
        setupActions()
        bindViewModel()
    }
    
    // MARK: - Setup
    
    private func setupDelegates() {
        rootView.navigationView.delegate = self
        rootView.emailTextField.delegate = self
        rootView.passwordTextField.delegate = self
    }
    
    private func setupActions() {
        rootView.emailTextField.addTarget(self, action: #selector(emailTextDidChange), for: .editingChanged)
        rootView.passwordTextField.addTarget(self, action: #selector(passwordTextDidChange), for: .editingChanged)
        
        rootView.emailClearButton.addTarget(self, action: #selector(emailClearButtonTapped), for: .touchUpInside)
        rootView.passwordClearButton.addTarget(self, action: #selector(passwordClearButtonTapped), for: .touchUpInside)
        rootView.passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        rootView.searchAccount.addTarget(self, action: #selector(searchAccountButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Bind ViewModel
    
    private func bindViewModel() {
        let input = LoginViewModel.Input(
            emailText: emailTextSubject.eraseToAnyPublisher(),
            passwordText: passwordTextSubject.eraseToAnyPublisher(),
            loginButtonTapped: loginButtonTappedSubject.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input: input)
        
        output.isLoginButtonEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isEnabled in
                self?.rootView.loginButton.isEnabled = isEnabled
                self?.rootView.loginButton.backgroundColor = isEnabled ? .baeminMint500 : .baeminGray200
            }
            .store(in: &cancellables)
        
        output.loginResult
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                self?.handleLoginResult(result)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Actions
    
    @objc private func emailTextDidChange() {
        let text = rootView.emailTextField.text ?? ""
        emailTextSubject.send(text)
    }
    
    @objc private func passwordTextDidChange() {
        let text = rootView.passwordTextField.text ?? ""
        passwordTextSubject.send(text)
    }
    
    @objc private func emailClearButtonTapped() {
        rootView.emailTextField.text = ""
        emailTextSubject.send("")
    }
    
    @objc private func passwordClearButtonTapped() {
        rootView.passwordTextField.text = ""
        passwordTextSubject.send("")
    }
    
    @objc private func passwordVisibilityButtonTapped() {
        rootView.passwordTextField.isSecureTextEntry.toggle()
        let isSecure = rootView.passwordTextField.isSecureTextEntry
        rootView.passwordVisibilityButton.setImage(
            UIImage(systemName: isSecure ? "eye.slash" : "eye"),
            for: .normal
        )
    }
    
    @objc private func loginButtonTapped() {
        loginButtonTappedSubject.send()
    }
    
    @objc private func searchAccountButtonTapped() {
        presentToSearchViewController()
    }
    
    private func handleLoginResult(_ result: LoginViewModel.LoginResult) {
        switch result {
        case .success(let email):
            pushToWelcomeViewController(email: email)
            
        case .failure(let error):
            let (title, message) = error.message
            showAlert(title: title, message: message)
        }
    }
    
    private func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: - Navigation
    
    private func pushToWelcomeViewController(email: String) {
        let vc = WelcomeViewController_Combine()
        vc.delegate = self
        vc.name = email
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func presentToSearchViewController() {
        let vc = SearchViewController()
        vc.delegate = self
        vc.sheetPresentationController?.largestUndimmedDetentIdentifier = .medium
        vc.sheetPresentationController?.prefersGrabberVisible = true
        vc.modalPresentationStyle = .automatic
        vc.sheetPresentationController?.detents = [.custom { _ in 320.0 }]
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController_Combine: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == rootView.emailTextField {
            rootView.floatingEmailLabel.isHidden = false
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1
        } else if textField == rootView.passwordTextField {
            rootView.floatingPasswordLabel.isHidden = false
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == rootView.emailTextField {
            rootView.floatingEmailLabel.isHidden = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.baeminGray200.cgColor
        } else if textField == rootView.passwordTextField {
            rootView.floatingPasswordLabel.isHidden = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.baeminGray200.cgColor
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == rootView.emailTextField {
            rootView.emailClearButton.isHidden = textField.text?.isEmpty ?? true
        }
        
        if textField == rootView.passwordTextField {
            let isEmpty = textField.text?.isEmpty ?? true
            rootView.passwordClearButton.isHidden = isEmpty
            rootView.passwordVisibilityButton.isHidden = isEmpty
        }
    }
}

// MARK: - SearchDelegate

extension LoginViewController_Combine: SearchDelegate {
    func confirmButtonDidTap(Email: String) {
        rootView.searchTextLabel.text = Email
    }
}

// MARK: - CustomNavigationDelegate

extension LoginViewController_Combine: CustomNavigationDelegate {
    func backButtonDidTap() {
    }
}

// MARK: - CombineWelcomeViewControllerDelegate

extension LoginViewController_Combine: CombineWelcomeViewControllerDelegate {
    func backToLogin() {
        rootView.emailTextField.text = ""
        rootView.passwordTextField.text = ""
        rootView.searchTextLabel.text = ""
        rootView.floatingEmailLabel.isHidden = true
        rootView.floatingPasswordLabel.isHidden = true
        emailTextSubject.send("")
        passwordTextSubject.send("")
    }
}
