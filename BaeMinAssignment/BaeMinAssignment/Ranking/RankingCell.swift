//
//  RankingGridCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/12/25.
//

import UIKit

import SnapKit

class RankingCell: UICollectionViewCell {
    static let identifier: String = "RankingCell"
    
    private let rankingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private var storeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private let storeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 12)
        label.textColor = .baeminGray600
        return label
    }()
    
    private let starImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = .star
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5"
        label.font = UIFont.font(.pretendardRegular, ofSize: 12)
        label.textColor = .baeminGray600
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardRegular, ofSize: 12)
        label.textColor = .baeminGray600
        return label
    }()
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "[든든한 한끼] 보쌈 막국수"
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        return label
    }()
    
    private var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    private let dcLabel: UILabel = {
        let label = UILabel()
        label.text = "25%"
        label.font = UIFont.font(.pretendardBold, ofSize: 14)
        label.textColor = .baeminHeadB14
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "12,000원"
        label.font = UIFont.font(.pretendardBold, ofSize: 14)
        return label
    }()
    
    private let beforePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "16,000원"
        label.font = UIFont.font(.pretendardRegular, ofSize: 12)
        label.textColor = .baeminGray600
        label.attributedText = label.text?.strikeThrough()
        return label
    }()
    
    private let minimumOrderPrice: UILabel = {
        let label = UILabel()
        label.text = "최소주문금액 없음"
        label.font = UIFont.font(.pretendardBold, ofSize: 13)
        label.textColor = .baeminHeadB13
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setHierarchy() {
        
        storeStackView.addArrangedSubview(storeName)
        storeStackView.addArrangedSubview(starImageView)
        storeStackView.addArrangedSubview(starLabel)
        storeStackView.addArrangedSubview(reviewCountLabel)
        priceStackView.addArrangedSubview(dcLabel)
        priceStackView.addArrangedSubview(priceLabel)
        
        verticalStackView.addArrangedSubview(storeStackView)
        verticalStackView.addArrangedSubview(menuLabel)
        verticalStackView.addArrangedSubview(priceStackView)
        verticalStackView.addArrangedSubview(beforePriceLabel)
        verticalStackView.addArrangedSubview(minimumOrderPrice)
        
        
        contentView.addSubview(rankingImageView)
        contentView.addSubview(verticalStackView)
    }
    
    private func setLayout() {

        rankingImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(145)
            $0.height.equalTo(145)
            
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(rankingImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(rankingImageView).inset(8)
        }
        
        priceStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(45)
        }

    }
    
    public func configure(feed: RankingModel) {
        rankingImageView.image = feed.rankingImage
        storeName.text = feed.storeName
        starLabel.text = feed.starLabel
        reviewCountLabel.text = feed.reviewCount
        menuLabel.text = feed.menu
        dcLabel.text = feed.dc
        priceLabel.text = feed.price
        beforePriceLabel.text = feed.beforePrice
    }
}

//#Preview {
//    RankingCell()
//}
