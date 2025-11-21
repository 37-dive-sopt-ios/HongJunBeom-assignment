//
//  NavigationCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

class NavigationCell: UICollectionViewCell {
    static let identifier: String = "NavigationCell"
    
    private var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "우리집"
        label.font = UIFont.font(.pretendardBold, ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private var polygonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .polygon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var iconStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
        
    lazy var benefitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .baeminBenefit), for: .normal)
        button.tintColor = .black
       
        return button
    }()
    
    lazy var bellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .baeminBell), for: .normal)
        button.tintColor = .black
       
        return button
    }()
    
    lazy var shoppingCartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .baeminCart), for: .normal)
        button.tintColor = .black
       
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    setUI()
    setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .baeminBackground
    }
    
    private func setDelegate() {
        
    }
    
    private func setLayout() {
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(polygonImageView)
        
        self.addSubviews(titleStackView, iconStackView)
        [benefitButton, bellButton, shoppingCartButton].forEach {
            iconStackView.addArrangedSubview($0)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        
        titleStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        iconStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
}
