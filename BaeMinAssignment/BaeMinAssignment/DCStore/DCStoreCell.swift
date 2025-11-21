//
//  DCStoreCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

import SnapKit

class DCStoreCell: UICollectionViewCell {
    static let identifier: String = "DCStoreCell"
    
    private let DCStoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let storeNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let storeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardBold, ofSize: 14)
        label.textColor = .baeminBlack
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fill
        return stackView
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
        label.font = UIFont.font(.pretendardBold, ofSize: 14)
        label.textColor = .baeminBlack
        return label
    }()
    
    private let reviewCount: UILabel = {
        let label = UILabel()
        label.text = "(1,234건)"
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        label.textColor = .baeminGray600
        return label
    }()
    
    private let deliveryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fill
        return stackView
    }()
    
    private let deliveryTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fill
        return stackView
    }()
    
    private let deliveryMoneyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .money
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let deliveryTime: UILabel = {
        let label = UILabel()
        label.text = "31~46분"
        label.font = UIFont.font(.pretendardRegular, ofSize: 13)
        label.textColor = .baeminBlack
        return label
    }()
    
    private let deliveryFeeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private let deliveryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .baeminClub
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let deliveryFee: UILabel = {
        let label = UILabel()
        label.text = "무료배달"
        label.font = UIFont.font(.pretendardBold, ofSize: 13)
        label.textColor = .baeminHeadB13
        return label
    }()
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let baeminClubImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .baeminClub2
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let pickUpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pickupable
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let reservationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let cleanVerificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .cleanVerification
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
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
        starStackView.addArrangedSubview(starImageView)
        starStackView.addArrangedSubview(starLabel)
        starStackView.addArrangedSubview(reviewCount)
        
        storeNameStackView.addArrangedSubview(storeName)
        storeNameStackView.addArrangedSubview(starStackView)
        
        deliveryTimeStackView.addArrangedSubview(deliveryMoneyImageView)
        deliveryTimeStackView.addArrangedSubview(deliveryTime)
        deliveryFeeStackView.addArrangedSubview(deliveryImageView)
        deliveryFeeStackView.addArrangedSubview(deliveryFee)
        deliveryStackView.addArrangedSubview(deliveryTimeStackView)
        deliveryStackView.addArrangedSubview(deliveryFeeStackView)
        
        imageStackView.addArrangedSubview(baeminClubImageView)
        imageStackView.addArrangedSubview(pickUpImageView)
        
        verticalStackView.addArrangedSubview(storeNameStackView)
        verticalStackView.addArrangedSubview(deliveryStackView)
        verticalStackView.addArrangedSubview(imageStackView)
        
        contentView.addSubview(DCStoreImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(cleanVerificationImageView)
    }
    
    private func setLayout() {
        
        DCStoreImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(188)
            $0.height.equalTo(126)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(DCStoreImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(DCStoreImageView)
        }
        
        storeNameStackView.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        storeName.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        
        starImageView.snp.makeConstraints {
            $0.width.equalTo(11)
            $0.height.equalTo(10)
        }
        
        storeNameStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        deliveryStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
        }
        
        deliveryMoneyImageView.snp.makeConstraints {
            $0.width.equalTo(13)
            $0.height.equalTo(13)
        }
        
        imageStackView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.trailing.equalToSuperview().inset(80)
        }
        
        cleanVerificationImageView.snp.makeConstraints {
            $0.top.equalTo(verticalStackView.snp.bottom)
            $0.width.equalTo(58)
            $0.height.equalTo(28)
        }
    }
    
    public func configure(feed: DCStoreModel) {
        DCStoreImageView.image = feed.DCStoreImage
        storeName.text = feed.storeName
        starLabel.text = feed.starCount
        reviewCount.text = feed.reviewCount
        deliveryTime.text = feed.deliveryTime
        deliveryFee.text = feed.deliveryFee
    }
}
