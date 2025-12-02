//
//  MyProfileCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/21/25.
//

import UIKit

import SnapKit
import Then

class MyProfileCell: BaseUITableViewCell {
    
    var name: String? {
        return nameTextField.text
    }
    
    var email: String? {
        return emailTextField.text
    }
    
    var age: Int? {
        return Int(ageTextField.text ?? "")
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "수정 사항"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameAndPhoneNumberStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 4
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "name"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "email"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    let ageTextField = UITextField().then {
        $0.placeholder = "age"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    override func setStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    override func setUI() {
        nameAndPhoneNumberStackView.addArrangedSubview(nameTextField)
        nameAndPhoneNumberStackView.addArrangedSubview(emailTextField)
        nameAndPhoneNumberStackView.addArrangedSubview(ageTextField)
        
        contentView.addSubviews(titleLabel, profileImage, nameAndPhoneNumberStackView)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints {
            
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(100)
        }
        
        nameAndPhoneNumberStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
            $0.height.equalTo(100)
        }
    }
    
    func configure(name: String?, email: String?, age: String?) {
        nameTextField.text = name
        emailTextField.text = email
        ageTextField.text = age
    }
}
