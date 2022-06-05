//
//  SignupDataModel.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/10.
//

import Foundation

// MARK: - DataClass
struct SignupResponseModel: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id
    }
}
