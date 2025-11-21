//
//  KaKaoSettingModel.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/21/25.
//

import Foundation

struct KaKaoSettingModel: Codable {
    let profileImage: String
    let settingTitle: String
    
    init(profileImage: String, settingTitle: String) {
        self.profileImage = profileImage
        self.settingTitle = settingTitle
    }
    
    static let mockData: [KaKaoSettingModel] = [
        KaKaoSettingModel(profileImage: "pencil", settingTitle: "개인정보 수정하기"),
        KaKaoSettingModel(profileImage: "person.text.rectangle", settingTitle: "개인정보 조회하기"),
        KaKaoSettingModel(profileImage: "clear.fill", settingTitle: "탈퇴하기"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ"),
        KaKaoSettingModel(profileImage: "person", settingTitle: "ㅋㅋ")
    ]
}


