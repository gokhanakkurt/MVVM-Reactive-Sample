//
//  UserService.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import Alamofire
import SwiftyJSON

class UserService {

    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchUsers(completionHandler: @escaping([User]?, Error?) -> Void){
        Alamofire.request(self.url, method: .get, parameters: nil).responseJSON { (response) in
            if let anError = response.error {
                completionHandler(nil, anError)
            }else {
                do {
                    let json = try JSON(data: response.data!)
                    let users : [User] = json.arrayValue.compactMap{
                        return User(id: $0["id"].stringValue, name: $0["name"].stringValue, username: $0["username"].stringValue, email: $0["email"].stringValue, phone: $0["phone"].stringValue, website: $0["website"].stringValue)
                    }
                    
                    completionHandler(users, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
}