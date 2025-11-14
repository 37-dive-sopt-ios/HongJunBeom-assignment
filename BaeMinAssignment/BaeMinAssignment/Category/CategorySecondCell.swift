//
//  CategorySecondCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

class CategorySecondCell: UICollectionViewCell {
    
    static let identifier: String = "CategorySecondCell"
    
     let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.font(.pretendardBold, ofSize: 18)
        label.textColor = .baeminGray200
        return label
    }()
    
    private let highlightView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryLabel.textColor = .baeminBlack
                highlightView.isHidden = false
            } else {
                categoryLabel.textColor = .baeminGray200
                highlightView.isHidden = true
            }
        }
    }
    
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
        self.addSubviews(categoryLabel, highlightView)
        
    }
    
    private func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        highlightView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(categoryLabel.snp.bottom).offset(10)
            $0.height.equalTo(3)
            $0.width.equalToSuperview().inset(6)
        }
    }
    
    public func configure(feed: CategoryModel) {
        categoryLabel.text = feed.categoryName
    }
}
