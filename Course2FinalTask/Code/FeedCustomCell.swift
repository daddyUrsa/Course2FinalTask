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

    var userAvatar: UIImageView = {
        let userAvatar = UIImageView()
        userAvatar.image = DataProviders.shared.usersDataProvider.currentUser().avatar
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false

        return userAvatar
    }()

    var userName: UILabel = {
        var userName = UILabel()
        userName.textAlignment = .left
        userName.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false

        return userName
    }()

    var postTime: UILabel = {
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
    
    var likesCountsLabel: UILabel = {
        let likesCountsLabel = UILabel()
        likesCountsLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        likesCountsLabel.textColor = .black
        likesCountsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return likesCountsLabel
    }()
    
    var likeIcon: UIImageView = {
        let likeIcon = UIImageView()
        likeIcon.image = UIImage(named: "like")
//        likeIcon.contentMode = .scaleToFill
        likeIcon.translatesAutoresizingMaskIntoConstraints = false
        
        return likeIcon
    }()
    
    var postDescriptionLabel: UILabel = {
        var postDescriptionLabel = UILabel()
        postDescriptionLabel.textAlignment = .left
        postDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
        postDescriptionLabel.textColor = .black
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        return postDescriptionLabel
    }()
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(userAvatar)
        contentView.addSubview(userName)
        contentView.addSubview(postTime)
        contentView.addSubview(postImage)
        contentView.addSubview(likesCountsLabel)
        contentView.addSubview(postDescriptionLabel)
        contentView.addSubview(likeIcon)

//        backgroundColor = .green
        setupViews()
//        print(contentView.layer.)
//        print(contentView.frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        NSLayoutConstraint.activate([userAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
                           userAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                           userAvatar.widthAnchor.constraint(equalToConstant: 44),
                           userAvatar.heightAnchor.constraint(equalToConstant: 44),

                           userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                           userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),

                           postTime.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 0),
                           postTime.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 5),

                           postImage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 10),
                           postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                           postImage.widthAnchor.constraint(equalToConstant: 312),
                           postImage.heightAnchor.constraint(equalToConstant: 312),
                           
                           likesCountsLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
                           likesCountsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                           
                           likeIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor),
                           likeIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                           likeIcon.widthAnchor.constraint(equalToConstant: 44),
                           likeIcon.heightAnchor.constraint(equalToConstant: 44),
                           
                           postDescriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 44),
                           postDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                           postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                           postDescriptionLabel.heightAnchor.constraint(equalToConstant: 40)
                           ])
    }

}
