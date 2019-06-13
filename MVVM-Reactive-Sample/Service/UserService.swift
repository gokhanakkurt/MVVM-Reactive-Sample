//
//  UserService.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import ReactiveSwift
import Alamofire
import SwiftyJSON

class UserService {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchUsers() -> SignalProducer<[User], Error> {
        
        return SignalProducer { observer, disposable in
            let request = Alamofire.request(self.url, method: .get, parameters: nil)
            request.responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    // decode json into user objects by using SwiftyJSON
                    do {
                        let json = try JSON(data: response.data!)
                        let users : [User] = json.arrayValue.compactMap{
                            return User(id: $0["id"].stringValue, name: $0["name"].stringValue, username: $0["username"].stringValue, email: $0["email"].stringValue, phone: $0["phone"].stringValue, website: $0["website"].stringValue)
                        }
                        observer.send(value: users)
                    } catch {
                        observer.send(error: error)
                    }
                    observer.sendCompleted()
                    
                case .failure(let error):
                    observer.send(error: error)
                }
            })
        }
    }
}
