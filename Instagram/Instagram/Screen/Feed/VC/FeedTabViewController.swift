//
//  FeedTabViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/17.
//

import UIKit

class FeedTabViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - Views
    lazy var storyCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let collectionViewNib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(collectionViewNib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 4 + 72 + 4)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPostTableView()
    }
}

// MARK: - Custom Methods
extension FeedTabViewController {
    private func setPostTableView() {
        let nib = UINib(nibName: PostTableViewCell.identifier, bundle: nil)
        postTableView.register(nib, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        // 스토리 CollectionView 아래 border
        let borderBottom = UIView(frame: CGRect(x:0, y:storyCollectionView.bounds.height, width: storyCollectionView.bounds.size.width, height: 1.0))
        borderBottom.backgroundColor = UIColor.self.init(red: 0.925, green: 0.925, blue: 0.925, alpha: 1.0)
        postTableView.addSubview(borderBottom)
        
        postTableView.tableHeaderView = storyCollectionView
    }
}

// MARK: - SendUpdateStatusDelegate
extension FeedTabViewController: SendUpdateStatusDelegate {
    func alertLikeStatus(status: Bool) {
        let message = status ? "like button is selected" : "like button is canceled"
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate
extension FeedTabViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension FeedTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FeedStoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setData(storyData: FeedStoryDataModel.sampleData[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

// MARK: - UITableViewDelegate
extension FeedTabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension FeedTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedPostDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        cell.setData(postData: FeedPostDataModel.sampleData[indexPath.row])
        cell.contentImage.contentMode = .scaleAspectFill
        
        cell.clickLikeDelegate = self
        
        return cell
    }
}
