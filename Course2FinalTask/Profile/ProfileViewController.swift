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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .cyan
        return scrollView
    }()
    
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
    
    lazy var followersTL: UILabel = {
        var followersTL = UILabel()
        followersTL.textAlignment = .left
        followersTL.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        followersTL.textColor = .black
        followersTL.translatesAutoresizingMaskIntoConstraints = false
        followersTL.isUserInteractionEnabled = true

        return followersTL
    }()
    
    var followingTL: UILabel = {
        var followingTL = UILabel()
        followingTL.textAlignment = .left
        followingTL.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        followingTL.textColor = .black
        followingTL.translatesAutoresizingMaskIntoConstraints = false
        followingTL.isUserInteractionEnabled = true

        return followingTL
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileViews()
        
//        loadData()
        view.backgroundColor = .white
        self.title = receivedUser.username
        
        userAvatar.image = receivedUser.avatar
        userName.text = receivedUser.fullName
        followersTL.text = "Followers: \(receivedUser.followedByCount)"
        followingTL.text = "Following: \(receivedUser.followsCount)"

        let followersTLTap = UITapGestureRecognizer(target: self, action: #selector(followersTLTapped))
        followersTL.addGestureRecognizer(followersTLTap)
        
        let followedTLTap = UITapGestureRecognizer(target: self, action: #selector(followedTLTapped))
        followingTL.addGestureRecognizer(followedTLTap)

    }

    func setupProfileViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(userAvatar)
        scrollView.addSubview(userName)
        scrollView.addSubview(followersTL)
        scrollView.addSubview(followingTL)
        scrollView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
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
        
        let contentHeight = 8 + userAvatar.frame.height + 8 + collectionView.collectionViewLayout.collectionViewContentSize.height
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentHeight)
        print(contentHeight)
    }

}

extension ProfileViewController {
    @objc func followersTLTapped() {
        let nextVC = UsersTableViewController()
        guard let users: [User] = DataProviders.shared.usersDataProvider.usersFollowingUser(with: receivedUser.id) else { return }
        nextVC.receivedUser = users
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func followedTLTapped() {
        let nextVC = UsersTableViewController()
        guard let users: [User] = DataProviders.shared.usersDataProvider.usersFollowedByUser(with: receivedUser.id) else { return }
        nextVC.receivedUser = users
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
