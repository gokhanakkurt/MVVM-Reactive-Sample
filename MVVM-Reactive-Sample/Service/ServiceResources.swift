//
//  ServiceResources.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import UIKit

enum ServiceResources {
    case users
    
    var url: String {
        switch self {
        case .users:
            return "https://jsonplaceholder.typicode.com/users" // sample rest api
        }
    }
}
