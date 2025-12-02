//
//  BaeMinWelcomeViewController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/23/25.
//

import UIKit

import SnapKit

protocol BaeMinWelcomeViewControllerDelegate: AnyObject {
    func backToLogin()
}

class BaeMinWelcomeViewController: UIViewController {
    
    var name: String?
    
    weak var delegate: BaeMinWelcomeViewControllerDelegate?
    
    private lazy var navigationView: CustomNavigationView = {
        let view = CustomNavigationView(screenType: .welcome)
        view.delegate = self
        return view
    }()
    
    private lazy var baeminImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "baemin"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel1: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.textAlignment = .center
        label.font = UIFont.font(.pretendardBold, ofSize: 24)
        
        return label
    }()
    
    private lazy var welcomeLabel2: UILabel = {
        let label = UILabel()
        label.text = "oo님 반가워요"
        label.textAlignment = .center
        label.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.baeminWhite, for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardBold, ofSize: 18)
        button.layer.cornerRadius = 4
        button.backgroundColor = .baeminMint500
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var goToMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로 가기", for: .normal)
        button.setTitleColor(.baeminWhite, for: .normal)
        button.titleLabel?.font = UIFont.font(.pretendardBold, ofSize: 18)
        button.layer.cornerRadius = 4
        button.backgroundColor = .baeminMint500
        button.addTarget(self, action: #selector(didTapGoToMain), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        bindName()
        setLayout()
    }
    
    private func setLayout() {
        [navigationView, baeminImageView, welcomeLabel1, welcomeLabel2, backButton, goToMainButton].forEach {
            view.addSubview($0)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        baeminImageView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        welcomeLabel1.snp.makeConstraints {
            $0.top.equalTo(baeminImageView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(130)
            $0.trailing.equalToSuperview().offset(-130)
        }
        
        welcomeLabel2.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel1.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        goToMainButton.snp.makeConstraints {
            $0.bottom.equalTo(backButton.snp.top).offset(-12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
    
    private func bindName() {
        if let name = name {
            if name.isEmpty {
                welcomeLabel2.text = "알수없음님 반가워요"
            } else {
                welcomeLabel2.text = "\(name)님 반가워요"
            }
        }
    }
    
    @objc
    private func didTapGoToMain() {
        pushToMainViewController()
    }
    
    private func pushToMainViewController() {
        let vc = TabBarController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BaeMinWelcomeViewController: CustomNavigationDelegate {
    @objc
    func backButtonDidTap() {
        delegate?.backToLogin()
        self.navigationController?.popViewController(animated: true)
    }
}

#Preview {
    BaeMinWelcomeViewController()
}


