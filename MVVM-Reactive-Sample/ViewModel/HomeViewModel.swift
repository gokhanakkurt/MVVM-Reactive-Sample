//
//  HomeViewModel.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import UIKit

import UIKit
import ReactiveSwift

class HomeViewModel {
    
    var isLoading : MutableProperty<Bool> = MutableProperty(false)
    
    var error = MutableProperty<Error?>(nil)
    
    var viewModels: MutableProperty<[UserViewModel]> = MutableProperty([UserViewModel]())
    
    var service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchUsers() {
        self.isLoading.value = true
        self.service.fetchUsers { [weak self] (response, error) in
            if let anError = error {
                self?.error.value = anError
            }
            
            if let users = response {
                self?.viewModels.value = users.compactMap{return UserViewModel(user: $0)} // convert to user cell models
            }
            
            self?.isLoading.value = false // set loading false
        }
    }
    
}

