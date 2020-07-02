//
//  ProfileView.swift
//  Course2FinalTask
//
//  Created by Alexey Golovin on 25.06.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit
import DataProvider
import DataProvider.Swift

class ProfileView: UIViewController {
    
    private var userAvatar: UIImageView = {
        let userAvatar = UIImageView()
        userAvatar.image = DataProviders.shared.usersDataProvider.currentUser().avatar
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false

        return userAvatar
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }


}
