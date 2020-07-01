//
//  FeedView.swift
//  Course2FinalTask
//
//  Created by Alexey Golovin on 25.06.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit
import DataProvider
import DataProvider.Swift

let cellId = "cellId"

class FeedView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let users = DataProviders.shared.usersDataProvider.usersFollowingUser(with: DataProviders.shared.usersDataProvider.currentUser().id)
//    let allUsers = DataProviders.shared.usersDataProvider.
    let posts = DataProviders.shared.postsDataProvider.feed()

    var allPosts: [Post] = []

    func allPostsFollowedUsers() {
        guard let users = users else { return }
        for valueUser in users.enumerated() {
            for valuePost in posts {
                if valueUser.element.id == valuePost.author {
                    allPosts.append(valuePost)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Feed"
        allPostsFollowedUsers()
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.register(FeedCustomCell.self, forCellWithReuseIdentifier: cellId)
//        users?.forEach { print($0.id) }
//        allPosts.forEach { print("\($0.id) \($0.author)") }
//        print(posts)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPosts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCustomCell

        cell.userName.text = posts[indexPath.item].authorUsername
        cell.userAvatar.image = posts[indexPath.item].authorAvatar
        cell.postImage.image = posts[indexPath.item].image
        cell.likesCountsLabel.text = "Likes: \(posts[indexPath.item].likedByCount)"
        cell.postDescriptionLabel.text = posts[indexPath.item].description
//        print(posts[indexPath.item].authorUsername)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 475)
    }
}

class FeedCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = .brown
    }
}
