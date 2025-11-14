//
//  ShoppingCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/12/25.
//

import UIKit

import SnapKit

class ShoppingCell: UICollectionViewCell {
    static let identifier: String = "ShoppingCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let nameLabel: UILabel = {
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
        self.addSubviews(itemImageView, nameLabel)
        
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
            $0.height.equalTo(58)
            $0.width.equalTo(58)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func configure(feed: ShoppingModel) {
        itemImageView.image = feed.itemImage
        nameLabel.text = feed.name
    }
}
