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

//    func getUserName(userId: User.Identifier) -> String {
//        var userName: String
//        for (index, valuePost) in posts.enumerated() {
//            if valuePost.author == userId {
////                guard let users = users else { return }
////                userName = users[index].filter { $0 }
//            }
//        }
//        return ""
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Feed"
        allPostsFollowedUsers()
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .cyan
        collectionView.register(FeedCustomCell.self, forCellWithReuseIdentifier: cellId)
//        users?.forEach { print($0.id) }
//        allPosts.forEach { print("\($0.id) \($0.author)") }
        print(posts)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPosts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCustomCell

        cell.userName.text = posts[indexPath.item].authorUsername
        cell.postImage.image = posts[indexPath.item].image
        print(posts[indexPath.item].authorUsername)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 385)
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

/*
 Проходим по usersFollowedByUser и достаем все идентификаторы. Потом проходим про feed  и выдергиваем массив все посты с id тех юзеров. Этот массив сортируем и выводим
 */
