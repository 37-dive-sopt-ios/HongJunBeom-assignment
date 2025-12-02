//
//  StoreSecondCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

class StoreSecondCell: UICollectionViewCell {
    static let identifier: String = "StoreSecondCell"
    
    private let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        return label
    }()
    // MARK: - Initialization
    
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
        self.backgroundColor = .white
    }
    
    private func setHierarchy() {
        self.addSubviews(storeImageView, storeNameLabel)
        
    }
    
    private func setLayout() {
        storeImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
            $0.height.equalTo(58)
            $0.width.equalTo(58)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func configure(feed: StoreModel) {
        storeImageView.image = feed.storeImage
        storeNameLabel.text = feed.storeName
    }
}
