//
//  FeedViewController+DataSource.swift
//  Course2FinalTask
//
//  Created by Alexey Pavlov on 02.07.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit
import DataProvider
import DataProvider.Swift

let cellId = "cellId"

let users = DataProviders.shared.usersDataProvider.usersFollowingUser(with: DataProviders.shared.usersDataProvider.currentUser().id)

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


extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPosts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCustomCell

        cell.userName.text = posts[indexPath.item].authorUsername
        cell.userAvatar.image = posts[indexPath.item].authorAvatar
        cell.postImage.image = posts[indexPath.item].image
        cell.likesCountsLabel.text = "Likes: \(posts[indexPath.item].likedByCount)"
        cell.postDescriptionLabel.text = posts[indexPath.item].description
        cell.backgroundColor = .white 
        return cell
    }

}
