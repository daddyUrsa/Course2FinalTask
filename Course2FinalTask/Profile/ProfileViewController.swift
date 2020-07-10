//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Alexey Golovin on 25.06.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//
import UIKit
import DataProvider
import DataProvider.Swift

class ProfileViewController: UIViewController {
    
    var receivedUser: User = DataProviders.shared.usersDataProvider.currentUser()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CustomProfileCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    private var userAvatar: UIImageView = {
        let userAvatar = UIImageView()
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false

        return userAvatar
    }()
    
    var userName: UILabel = {
        var userName = UILabel()
        userName.textAlignment = .left
        userName.font = UIFont.systemFont(ofSize: 14)
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false

        return userName
    }()
    
    var followersTL: UILabel = {
        var followersTL = UILabel()
        followersTL.textAlignment = .left
        followersTL.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        followersTL.textColor = .black
        followersTL.translatesAutoresizingMaskIntoConstraints = false

        return followersTL
    }()
    
    var followingTL: UILabel = {
        var followingTL = UILabel()
        followingTL.textAlignment = .left
        followingTL.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        followingTL.textColor = .black
        followingTL.translatesAutoresizingMaskIntoConstraints = false

        return followingTL
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.title = receivedUser.username
        
        userAvatar.image = receivedUser.avatar
        userName.text = receivedUser.fullName
        followersTL.text = "Followers: \(receivedUser.followedByCount)"
        followingTL.text = "Following: \(receivedUser.followsCount)"
        
        setupProfileViews()

    }
    
    func setupProfileViews() {
        view.addSubview(userAvatar)
        view.addSubview(userName)
        view.addSubview(followersTL)
        view.addSubview(followingTL)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                                     userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                                     userAvatar.widthAnchor.constraint(equalToConstant: 70),
                                     userAvatar.heightAnchor.constraint(equalToConstant: 70),
                                     
                                     userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                                     userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
                                     
                                     followersTL.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
                                     followersTL.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -8),
                                     
                                     followingTL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     followingTL.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -8),
                                     
                                     collectionView.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 8),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
