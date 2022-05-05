//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/03.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "PostTableViewCell"
    var clickLikeDelegate: SendUpdateStatusDelegate?
    
    // MARK: - IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var likeInfoLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameContentLabel: UILabel!
    @IBOutlet weak var commentInfoLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //    }
}

// MARK: - Custom Methods
extension PostTableViewCell {
    func setData(postData: FeedPostDataModel) {
        profileImage.image = UIImage(named: postData.profileImage)
        userNameLabel.text = postData.userName
        contentImage.image = UIImage(named: postData.contentImage)
        likeInfoLabel.text = postData.likeInfo
        nameContentLabel.text = postData.userName
        contentLabel.text = postData.content
        commentInfoLabel.text = postData.commentInfo
    }
    
    // MARK: IBAction
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        likeButton.isSelected.toggle()
        if let clickLikeDelegate = clickLikeDelegate {
            clickLikeDelegate.alertLikeStatus(status: likeButton.isSelected)
        }
        let likeImageName = likeButton.isSelected ? "icn_like" : "Like"
        likeButton.setImage(UIImage(named: likeImageName), for: .normal)
    }
}
