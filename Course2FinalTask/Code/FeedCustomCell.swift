//
//  FeedCell.swift
//  Course2FinalTask
//
//  Created by Alexey Pavlov on 01.07.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit
import DataProvider

class FeedCustomCell: UICollectionViewCell {

    let userAvatar: UIImageView = {
        let userAvatar = UIImageView()
        userAvatar.image = DataProviders.shared.usersDataProvider.currentUser().avatar
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false

        return userAvatar
    }()

    let userName: UILabel = {
        var userName = UILabel()
        userName.textAlignment = .left
        userName.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        userName.textColor = .black
        userName.text = DataProviders.shared.usersDataProvider.currentUser().username
        userName.translatesAutoresizingMaskIntoConstraints = false

        return userName
    }()

    let postTime: UILabel = {
        var postTime = UILabel()
        postTime.textAlignment = .left
        postTime.font = UIFont.systemFont(ofSize: 14)
        postTime.textColor = .black
        postTime.text = "02-07-2020"
        postTime.translatesAutoresizingMaskIntoConstraints = false

        return postTime
    }()

    let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.image = DataProviders.shared.postsDataProvider.post(with: Post.Identifier(rawValue: "25"))?.image
        postImage.contentMode = .scaleAspectFit
        postImage.translatesAutoresizingMaskIntoConstraints = false

        return postImage
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(userAvatar)
        contentView.addSubview(userName)
        contentView.addSubview(postTime)
        contentView.addSubview(postImage)

        backgroundColor = .green
        setupViews()
//        print(contentView.layer.)
//        print(contentView.frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        NSLayoutConstraint.activate([userAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
                           userAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                           userAvatar.widthAnchor.constraint(equalToConstant: 44),
                           userAvatar.heightAnchor.constraint(equalToConstant: 44),

                           userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                           userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),

                           postTime.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 0),
                           postTime.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),

                           postImage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 10),
                           postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                           postImage.widthAnchor.constraint(equalToConstant: 320),
                           postImage.heightAnchor.constraint(equalToConstant: 320)
                           ])
    }

}
