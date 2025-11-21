//
//  RecentOrderHeaderCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

import SnapKit

final class RecentOrderHeaderCell: UICollectionReusableView {
    static let identifier: String = "RecentOrderHeaderCell"
    
    private var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 159
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
        label.text = "최근에 주문했어요"
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
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체보기 >"
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminBlack
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
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(infoImage)
        
        totalStackView.addArrangedSubview(titleStackView)
        totalStackView.addArrangedSubview(viewAllLabel)
        
        self.addSubviews(totalStackView)
        
        titleStackView.snp.makeConstraints {
            $0.width.equalTo(150)
        }
        
        totalStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(200)
        }
        
        infoImage.snp.makeConstraints {
            $0.width.height.equalTo(12)
        }
    }
}
