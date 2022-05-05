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
        return "댓글 \(commentCount)개 모두 보기"
    }
}

// 더미데이터
extension FeedPostDataModel {
    static let sampleData: [FeedPostDataModel] = [
        FeedPostDataModel(profileImage: "avatar1", userName: "user1", contentImage:"postImage1" ,content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", likeCount: 30, commentCount: 19),
        FeedPostDataModel(profileImage: "avatar2", userName: "user2", contentImage:"postImage2" ,content: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", likeCount: 330, commentCount: 24),
        FeedPostDataModel(profileImage: "avatar3", userName: "user3", contentImage:"postImage3" ,content: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다. ", likeCount: 130, commentCount: 100),
        FeedPostDataModel(profileImage: "avatar4", userName: "user4", contentImage:"postImage4" ,content: "내용입니다", likeCount: 234, commentCount: 111)
        ]
}
