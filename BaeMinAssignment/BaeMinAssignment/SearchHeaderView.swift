//
//  SearchHeaderView.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

class SearchHeaderView: UICollectionReusableView {
    static let identifier = "SearchHeaderView"
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        return button
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.text = "찾아라! 맛있는 음식과 맛집"
        label.textColor = .baeminGray300
        label.font = UIFont.font(.pretendardRegular, ofSize: 14)
        return label
    }()
    
    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .black
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
        self.backgroundColor = .baeminBackground
    }
    
    private func setLayout() {
        
        self.addSubviews(searchButton, searchLabel, searchImageView)

        
        searchButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        searchLabel.snp.makeConstraints {
            $0.leading.equalTo(searchButton.snp.leading).offset(16)
            $0.centerY.equalTo(searchButton)
        }
        
        searchImageView.snp.makeConstraints {
            $0.trailing.equalTo(searchButton.snp.trailing).offset(-16)
            $0.centerY.equalTo(searchButton)
        }
        
        
    }
    
}
