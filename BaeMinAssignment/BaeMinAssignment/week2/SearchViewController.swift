//
//  SearchViewController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/30/25.
//

import UIKit

import SnapKit

protocol SearchDelegate: AnyObject {
    func confirmButtonDidTap(Email: String)
}

class SearchViewController: UIViewController {
    
    weak var delegate: SearchDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일을 입력해주세요"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
       return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력해주세요"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .diveWhite
        textField.addLeftPadding()
        textField.addRightPadding()
       return textField
    }()
    
    private lazy var confirmButton: UIButton = {
       let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .baeminMint500
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .diveGray
        view.heightAnchor.constraint(equalToConstant: 320).isActive = true
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, emailTextField, confirmButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(33)
            $0.leading.equalToSuperview().offset(17)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(46)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(236)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(46)
        }
    }
    
    @objc
    private func confirmButtonDidTap() {
        delegate?.confirmButtonDidTap(Email: emailTextField.text ?? "")
        
        self.dismiss(animated: true)
    }
}
