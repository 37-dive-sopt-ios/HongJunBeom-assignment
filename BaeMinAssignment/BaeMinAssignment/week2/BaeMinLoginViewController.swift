//
//  BaeMinLoginViewController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/23/25.
//

import UIKit

import SnapKit


class BaeMinLoginViewController: UIViewController {
    
    private lazy var navigationView: CustomNavigationView = {
        let view = CustomNavigationView(screenType: .login)
        view.delegate = self
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.font(.pretendardRegular, ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 아이디", attributes: [NSAttributedString.Key.foregroundColor: UIColor.baeminGray700])
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.addLeftPadding()
        textField.addRightPadding(50)
        textField.delegate = self
        return textField
    }()
    
    lazy var emailClearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.isHidden = true
        button.tintColor = .gray
        button.addTarget(self, action: #selector(emailClearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var floatingEmailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 10)
        label.text = " 이메일 아이디 "
        label.textColor = .baeminGray700
        label.backgroundColor = .baeminWhite
        label.isHidden = true
        return label
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.font(.pretendardRegular, ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.baeminGray700])
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.isSecureTextEntry = true
        textField.addLeftPadding()
        textField.addRightPadding(85)
        textField.delegate = self
        return textField
    }()
    
    private lazy var floatingPasswordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 10)
        label.text = " 비밀번호 "
        label.textColor = .baeminGray700
        label.backgroundColor = .baeminWhite
        label.isHidden = true
        return label
    }()
    
    lazy var passwordClearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.isHidden = true
        button.tintColor = .gray
        button.addTarget(self, action: #selector(passwordClearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // 비밀번호 표시여부 버튼(눈 모양)
    lazy var passwordVisibilityButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 320, y: 345, width: 24, height: 24))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        button.addTarget(self, action: #selector(passwordVisibilityButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardBold, ofSize: 18)
        button.setTitleColor(.baeminWhite, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .baeminGray200
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchAccount: UIButton = {
        let button = UIButton()
        button.setTitle("계정 찾기 >", for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardRegular, ofSize: 14)
        button.setTitleColor(.baeminBlack, for: .normal)
        button.addTarget(self, action: #selector(searchAccountButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminBlack
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
        [navigationView, floatingEmailLabel, emailTextField, emailClearButton, passwordTextField, floatingPasswordLabel,passwordClearButton, passwordVisibilityButton,loginButton, searchAccount, searchTextLabel].forEach { view.addSubview($0)}
        
        self.view.bringSubviewToFront(floatingEmailLabel)
        
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(111)
            $0.height.equalTo(46)
        }
        
        emailClearButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.top).offset(13)
            $0.bottom.equalTo(emailTextField.snp.bottom).offset(-13)
            $0.trailing.equalTo(emailTextField.snp.trailing).offset(-20)
        }
        
        floatingEmailLabel.snp.makeConstraints {
            $0.leading.equalTo(emailTextField.snp.leading).offset(9)
            $0.top.equalToSuperview().offset(103)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(46)
        }
        
        floatingPasswordLabel.snp.makeConstraints {
            $0.leading.equalTo(passwordTextField.snp.leading).offset(9)
            $0.top.equalTo(emailTextField.snp.bottom).offset(8)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(13)
            $0.bottom.equalTo(passwordTextField.snp.bottom).offset(-13)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-56)
        }
        
        passwordVisibilityButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(13)
            $0.bottom.equalTo(passwordTextField.snp.bottom).offset(-13)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(46)
        }
        
        searchAccount.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(154.5)
            $0.trailing.equalToSuperview().offset(-154.5)
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.height.equalTo(14)
        }
        
        searchTextLabel.snp.makeConstraints {
            $0.top.equalTo(searchAccount.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(130)
        }
    }
    
    private func pushToWelcomeViewController() {
        let vc = BaeMinWelcomeViewController()
        vc.delegate = self
        vc.name = emailTextField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //계정찾기 모달 띄우기
    private func presentToSearchViewController() {
        let vc = SearchViewController()
        vc.delegate = self
        vc.sheetPresentationController?.largestUndimmedDetentIdentifier = .medium
        vc.sheetPresentationController?.prefersGrabberVisible = true
        vc.modalPresentationStyle = .automatic
        vc.sheetPresentationController?.detents = [.custom { _ in
            320.0
        }]
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
        
    }
    
    // 이메일 클리어 버튼 동작 함수
    @objc
    private func emailClearButtonDidTap() {
        emailTextField.text = nil
    }
    
    // 비밀번호 클리어, 눈모양 버튼 동작 함수
    @objc
    private func passwordClearButtonDidTap() {
        passwordTextField.text = nil
    }
    
    @objc
    private func passwordVisibilityButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let isSecure = passwordTextField.isSecureTextEntry
        passwordVisibilityButton.setImage(UIImage(systemName: isSecure ? "eye.slash" : "eye"), for: .normal)
    }
    
    // 계정 찾기 버튼 동작 함수
    @objc
    private func searchAccountButtonDidTap() {
        presentToSearchViewController()
    }

    // MARK: - 유효성 검사
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordPattern)
        return passwordPredicate.evaluate(with: password)
    }
    
    @objc
    private func loginButtonDidTap() {
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        let isEmailValid = isValidEmail(email: emailText)
        let isPasswordValid = isValidPassword(password: passwordText)
        
        if isEmailValid && isPasswordValid {
            pushToWelcomeViewController()
        } else if isEmailValid == true && isPasswordValid == false {
            let alert = makeAlert(title: "비밀번호 형식에 맞지 않습니다", message: "영문, 숫자, 특수문자를 포함하여 8자 이상 입력하세요.")
            present(alert, animated: true)
        } else if isEmailValid == false && isPasswordValid == true {
            let alert = makeAlert(title: "이메일 형식에 맞지 않습니다", message: nil)
            present(alert, animated: true)
        } else {
            let alert = makeAlert(title: "이메일/비밀번호 형식에 맞지 않습니다", message: nil)
            present(alert, animated: true)
        }
        
        func makeAlert(title: String, message: String?) -> UIAlertController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            return alert
        }
    }
}


extension BaeMinLoginViewController: SearchDelegate {
    func confirmButtonDidTap(Email: String) {
        searchTextLabel.text = Email
    }
}

extension BaeMinLoginViewController: CustomNavigationDelegate {
    func backButtonDidTap() {
        print("")
    }
}

extension BaeMinLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder()
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            floatingEmailLabel.isHidden = false
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1
        } else if textField == passwordTextField {
            floatingPasswordLabel.isHidden = false
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            floatingEmailLabel.isHidden = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.baeminGray200.cgColor
        } else if textField == passwordTextField {
            floatingPasswordLabel.isHidden = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.baeminGray200.cgColor
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            if let text = textField.text, text.isEmpty {
                emailClearButton.isHidden = true
            } else {
                emailClearButton.isHidden = false
            }
        }
        
        if textField == passwordTextField {
            if let text = textField.text, text.isEmpty {
                passwordClearButton.isHidden = true
                passwordVisibilityButton.isHidden = true
                
            } else {
                passwordClearButton.isHidden = false
                passwordVisibilityButton.isHidden = false
            }
        }
   
        if (emailTextField.text?.count ?? 0 < 1) || (passwordTextField.text?.count ?? 0 < 1) {
            updateLoginButtonState(isEnabled: false, backgroundColor: .baeminGray200)
        } else {
            updateLoginButtonState(isEnabled: true, backgroundColor: .baeminMint500)
        }
    }
    
    func updateLoginButtonState(isEnabled: Bool, backgroundColor: UIColor) {
        loginButton.isEnabled = isEnabled
        loginButton.backgroundColor = backgroundColor
    }
}

extension BaeMinLoginViewController: BaeMinWelcomeViewControllerDelegate {
    func backToLogin() {
        emailTextField.text = ""
        passwordTextField.text = ""
        searchTextLabel.text = ""
        floatingEmailLabel.isHidden = true
        floatingPasswordLabel.isHidden = true
    }
}

#Preview {
    BaeMinLoginViewController()
}
