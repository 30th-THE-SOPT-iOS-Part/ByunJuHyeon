//
//  SigninModel.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/10.
//

import Foundation

// MARK: - DataClass
struct SigninResponseModel: Codable {
    let name: String
    let email: String

    // 커스텀 키 매핑
    // JSON에서 Key는 항상 String이기 때문에 Raw Value타입으로 String 넣어줌
    enum CodingKeys: String, CodingKey {
        case name, email
    }
}
