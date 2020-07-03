//
//  ProfileViewController+DataSource.swift
//  Course2FinalTask
//
//  Created by Alexey Golovin on 03.07.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit
import DataProvider
import DataProvider.Swift

let cellID = "cellId"

let currentUserPosts = DataProviders.shared.postsDataProvider.findPosts(by: DataProviders.shared.usersDataProvider.currentUser().id)

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomProfileCell
        guard let currentUserPosts = currentUserPosts else { return cell }
        cell.postImageCell.image = currentUserPosts[indexPath.item].image
        return cell
    }
    
    
    
    
}
