//
//  FeedStoryDataModel.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/02.
//

import UIKit

struct FeedStoryDataModel {
    let profileImage: String
    let userName: String
}

// 더미데이터
extension FeedStoryDataModel {
    static let sampleData: [FeedStoryDataModel] = [
        FeedStoryDataModel(profileImage: "avatar1", userName: "user1"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user2"),
        FeedStoryDataModel(profileImage: "avatar1", userName: "user3")
    ]
}

