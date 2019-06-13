//
//  UserViewModel.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import UIKit

class UserViewModel {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func setupView(_ cell: UserTableViewCell) {
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = "@\(user.username)".lowercased()
    }
}
