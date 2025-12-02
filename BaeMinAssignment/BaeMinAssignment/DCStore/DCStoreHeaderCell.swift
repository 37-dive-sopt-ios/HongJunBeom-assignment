//
//  DCStoreHeaderCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

import SnapKit

final class DCStoreHeaderCell: UICollectionReusableView {
    static let identifier: String = "DCStoreHeaderCell"
    
    private var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.alignment = .center
        return stackView
    }()
    
    private var verticalLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fill
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "무조건 할인하는 가게"
        label.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        label.textColor = .baeminBlack
        return label
    }()
    
    private let infoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .infoBlack
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let smallLabel: UILabel = {
        let label = UILabel()
        label.text = "2천원 이상 또는 15% 이상 할인중"
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminGray300
        return label
    }()
    
    private let wonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .won
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(infoImage)
        
        verticalLabelStackView.addArrangedSubview(titleStackView)
        verticalLabelStackView.addArrangedSubview(smallLabel)
        
        totalStackView.addArrangedSubview(verticalLabelStackView)
        totalStackView.addArrangedSubview(wonImageView)
        
        self.addSubviews(totalStackView)
        
        totalStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        verticalLabelStackView.snp.makeConstraints {
            $0.width.equalTo(190)
        }
        
        titleStackView.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        smallLabel.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(150)
        }
        
        infoImage.snp.makeConstraints {
            $0.width.height.equalTo(12)
        }
    }
}
