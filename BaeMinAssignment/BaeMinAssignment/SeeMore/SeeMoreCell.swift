//
//  SeeMoreCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

class SeeMoreCell: UICollectionViewCell {
    static let identifier: String = "SeeMoreCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "음식배달에서 더보기 >"
        label.font = UIFont.font(.pretendardBold, ofSize: 14)
        label.textAlignment = .center
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
        self.backgroundColor = .white
    }
    
    private func setDelegate() {
        
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configure(feed: SeeMoreModel) {
        titleLabel.text = feed.title
    }
}
