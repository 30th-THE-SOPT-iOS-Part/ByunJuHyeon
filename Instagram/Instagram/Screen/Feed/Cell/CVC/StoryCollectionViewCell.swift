//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/02.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "StoryCollectionViewCell"

    // MARK: - IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Custom Methods
    func setData(storyData: FeedStoryDataModel) {
        profileImage.image = UIImage(named: storyData.profileImage)
        userName.text = storyData.userName
    }
}
