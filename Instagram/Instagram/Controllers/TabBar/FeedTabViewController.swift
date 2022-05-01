//
//  FeedTabViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/17.
//

import UIKit

class FeedTabViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStoryCollectionView()
    }
}

// MARK: - Custom Methods
extension FeedTabViewController {
    private func setStoryCollectionView() {
        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
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

