//
//  KaKaoSettingCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/21/25.
//

import UIKit

import SnapKit
import Then

class KaKaoSettingCell: BaseUITableViewCell {
    
    private let image = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill")
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "카카오계정"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 16)
        $0.textColor = .black
    }
    
    override func setStyle() {
        backgroundColor = .white
    }
    
    override func setUI() {
        contentView.addSubviews(image, titleLabel)
    }
    
    override func setLayout() {
        image.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(image.snp.trailing).offset(12)
        }
    }
    
    func configure(kakaoSetting: KaKaoSettingModel) {
        image.image = UIImage(systemName: kakaoSetting.profileImage)
        titleLabel.text = kakaoSetting.settingTitle
    }
}

#Preview {
    KaKaoSettingCell()
}
