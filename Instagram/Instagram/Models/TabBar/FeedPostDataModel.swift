//
//  FeedPostDataModel.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/02.
//

import UIKit

struct FeedPostDataModel {
    let profileImage: String
    let userName: String
    let contentImage: String
    let content: String
    let likeCount: Int
    let commentCount: Int
    var likeInfo: String? {
        return "좋아요 \(likeCount)개"
    }
    var commentInfo: String? {
        return "댓글 \(commentCount) 모두 보기"
    }
}

// 더미데이터
extension FeedPostDataModel {
    static let sampleData: [FeedPostDataModel] = [
        FeedPostDataModel(profileImage: "avatar1", userName: "juhyeon", contentImage:"postImage1" ,content: "내용입니다", likeCount: 1, commentCount: 1),
        FeedPostDataModel(profileImage: "avatar1", userName: "juhyeon", contentImage:"postImage1" ,content: "내용입니다", likeCount: 2, commentCount: 2),
        FeedPostDataModel(profileImage: "avatar1", userName: "juhyeon", contentImage:"postImage1" ,content: "내용입니다", likeCount: 3, commentCount: 3),
        FeedPostDataModel(profileImage: "avatar1", userName: "juhyeon", contentImage:"postImage1" ,content: "내용입니다", likeCount: 4, commentCount: 4)
        ]
}
