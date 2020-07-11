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

func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
}

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

extension FeedViewController: UICollectionViewDataSource, CellTappedDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPosts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCustomCell
        cell.postID = posts[indexPath.item].id
        cell.userName.text = posts[indexPath.item].authorUsername
        cell.userAvatar.image = posts[indexPath.item].authorAvatar
        cell.postTime.text = getFormattedDate(date: posts[indexPath.item].createdTime, format: "MMM d, YYYY") + " at " + getFormattedDate(date: posts[indexPath.item].createdTime, format: "h:mm:ss a")
        cell.postImage.image = posts[indexPath.item].image
        cell.likesCountsLabel.text = "Likes: \(posts[indexPath.item].likedByCount)"
        cell.postDescriptionLabel.text = posts[indexPath.item].description
        if posts[indexPath.item].currentUserLikesThisPost != true {
        cell.likeIcon.tintColor = .darkGray
        }
        cell.backgroundColor = .white
        cell.delegate = self
        cell.userID = posts[indexPath.item].author
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FeedCustomCell
        cell.delegate?.showUserProfile(sender: posts[indexPath.item].author)
    }
    
    func showUserProfile(sender: User.Identifier) {
        let profileView = ProfileViewController()
        guard let nextVC = tabBarController else { return }
        guard let user = DataProviders.shared.usersDataProvider.user(with: sender) else { return }
//        nextVC.receivedUser = user
        nextVC.selectedIndex = 1
        profileView.receivedUser = user
        print("Readу to send ----- User ID: \(user.id.rawValue)")
        profileView.viewDidLoad()

//        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
