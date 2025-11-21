//
//  EventCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

final class EventCell: UICollectionViewCell {
    
    static var identifier: String = "EventCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bmart
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "전상품 쿠폰팩 + 60% 특가 >"
        label.font = UIFont.font(.pretendardBold, ofSize: 16)
        label.textColor = .baeminBlack
        label.numberOfLines = 1
        return label
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
        self.addSubviews(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        

        
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(200)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(200)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(16)
        }
    }
}
