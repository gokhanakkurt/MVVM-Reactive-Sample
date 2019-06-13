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
    
    private var service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchUsers() {
        self.isLoading.value = true
        
        self.service
            .fetchUsers()
            .start(Signal<[User], Error>.Observer (value: { [weak self] values in
                // assign mutable property
                self?.viewModels.value = values.compactMap{return UserViewModel(user: $0)} // convert to user cell models
                self?.isLoading.value = false // done
                
            }, failed: { [weak self] error in
                // failed or an error occured
                self?.error.value = error
                self?.isLoading.value = false // done
            }))
    }
    
}

