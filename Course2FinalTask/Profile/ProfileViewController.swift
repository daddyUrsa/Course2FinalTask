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
    
    lazy var followersTL: UILabel = {
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
        
        setupProfileViews()
        loadData()
        view.backgroundColor = .white
        self.title = receivedUser.username
        
        userAvatar.image = receivedUser.avatar
        userName.text = receivedUser.fullName
        followersTL.text = "Followers: \(receivedUser.followedByCount)"
        followingTL.text = "Following: \(receivedUser.followsCount)"

        let followersTLTap = UITapGestureRecognizer(target: self, action: #selector(followersTLTapped))
        followersTL.isUserInteractionEnabled = true
        followersTL.addGestureRecognizer(followersTLTap)

        print("viewDidLoad ----- User ID: \(receivedUser.id.rawValue)")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear ----- User ID: \(receivedUser.id.rawValue)")
    }
    
    func loadData() {
        // code to load data from network, and refresh the interface
        collectionView.reloadData()
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

extension ProfileViewController {
    @objc func followersTLTapped() {
        print("tapped")
        let nextVC = UsersTableViewController()
//        guard let user = DataProviders.shared.usersDataProvider.user(with: receivedUser.id) else { return }
//        nextVC.receivedUser = user
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
