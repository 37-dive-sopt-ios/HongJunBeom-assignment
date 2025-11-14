//
//  RankingHeaderCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

import SnapKit

final class RankingHeaderCell: UICollectionReusableView {
    static let identifier = "RankingHeaderCell"
    
    private var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100
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
        label.text = "우리 동네 한그릇 인기 랭킹"
        label.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        label.textColor = .baeminWhite
        return label
    }()
    
    private let infoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .info
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체보기 >"
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminWhite
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
