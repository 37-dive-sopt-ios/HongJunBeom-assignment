//
//  CustomNavigationViewController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 10/30/25.
//

import UIKit

import SnapKit

enum ScreenType {
    case login
    case welcome
    
    var title: String {
        switch self {
        case .login:
            return "이메일 또는 아이디로 계속"
        case .welcome:
            return "대체 뼈찜 누가 시켰어??"
        }
    }
}


protocol CustomNavigationDelegate: AnyObject {
    func backButtonDidTap()
}

class CustomNavigationView: UIView {
    
    weak var delegate: CustomNavigationDelegate?
    
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Navigation"
        label.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        label.textColor = .baeminBlack
        return label
    }()
    
    var screenType: ScreenType = .login {
        didSet {
            setupUI()
        }
    }
    
    init(screenType: ScreenType) {
        self.screenType = screenType
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.subviews.forEach { $0.removeFromSuperview() }
        self.addSubview(mainView)
    
        mainView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        updateHeightConstraint()
        navigationSetup()
    }
    
    private func updateHeightConstraint() {
        self.constraints.filter { $0.firstAttribute == .height }.forEach { self.removeConstraint($0) }
        
        let height: CGFloat = 44
        
        self.snp.makeConstraints {
            $0.height.equalTo(height)
        }
    }
    
    private func navigationSetup() {
        self.titleLabel.text = self.screenType.title
        
        [titleLabel, backButton].forEach {
            self.mainView.addSubview($0)
        }
        
        let buttonImage = UIImage(systemName: "arrow.backward")
        
        self.backButton.setImage(buttonImage, for: .normal)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.mainView.snp.leading).offset(16)
            $0.height.equalTo(36)
            $0.width.equalTo(36)
        }
    }
    
    @objc
    private func backButtonDidTap() {
        delegate?.backButtonDidTap()
    }
}

