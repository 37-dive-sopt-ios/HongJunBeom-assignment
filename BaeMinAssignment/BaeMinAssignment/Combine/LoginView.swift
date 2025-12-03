//
//  LoginView.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 12/3/25.
//

import UIKit

import SnapKit

final class LoginView: UIView {
    
    // MARK: - UI Components
    
    let navigationView: CustomNavigationView = {
        let view = CustomNavigationView(screenType: .login)
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.font(.pretendardRegular, ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(
            string: "이메일 아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.baeminGray700]
        )
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.addLeftPadding()
        textField.addRightPadding(50)
        return textField
    }()
    
    let emailClearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.isHidden = true
        button.tintColor = .gray
        return button
    }()
    
    let floatingEmailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 10)
        label.text = " 이메일 아이디 "
        label.textColor = .baeminGray700
        label.backgroundColor = .baeminWhite
        label.isHidden = true
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.font(.pretendardRegular, ofSize: 14)
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.baeminGray700]
        )
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.isSecureTextEntry = true
        textField.addLeftPadding()
        textField.addRightPadding(85)
        return textField
    }()
    
    let floatingPasswordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 10)
        label.text = " 비밀번호 "
        label.textColor = .baeminGray700
        label.backgroundColor = .baeminWhite
        label.isHidden = true
        return label
    }()
    
    let passwordClearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.isHidden = true
        button.tintColor = .gray
        return button
    }()
    
    let passwordVisibilityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardBold, ofSize: 18)
        button.setTitleColor(.baeminWhite, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .baeminGray200
        return button
    }()
    
    let searchAccount: UIButton = {
        let button = UIButton()
        button.setTitle("계정 찾기 >", for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardRegular, ofSize: 14)
        button.setTitleColor(.baeminBlack, for: .normal)
        return button
    }()
    
    let searchTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminBlack
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        [navigationView, floatingEmailLabel, emailTextField, emailClearButton,
         passwordTextField, floatingPasswordLabel, passwordClearButton,
         passwordVisibilityButton, loginButton, searchAccount, searchTextLabel].forEach {
            addSubview($0)
        }
        
        bringSubviewToFront(floatingEmailLabel)
        
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(111)
            $0.height.equalTo(46)
        }
        
        emailClearButton.snp.makeConstraints {
            $0.centerY.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField).offset(-20)
            $0.width.height.equalTo(20)
        }
        
        floatingEmailLabel.snp.makeConstraints {
            $0.leading.equalTo(emailTextField).offset(9)
            $0.top.equalToSuperview().offset(103)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(46)
        }
        
        floatingPasswordLabel.snp.makeConstraints {
            $0.leading.equalTo(passwordTextField).offset(9)
            $0.top.equalTo(emailTextField.snp.bottom).offset(8)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField).offset(-56)
            $0.width.height.equalTo(20)
        }
        
        passwordVisibilityButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField).offset(-20)
            $0.width.height.equalTo(24)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(46)
        }
        
        searchAccount.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.height.equalTo(14)
        }
        
        searchTextLabel.snp.makeConstraints {
            $0.top.equalTo(searchAccount.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(130)
        }
    }
}
