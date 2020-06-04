//
//  HttpAlamo.swift
//  Network
//
//  Created by 이치원 on 2020/06/04.
//  Copyright © 2020 richone. All rights reserved.
//

import Foundation
import Alamofire

struct UserService {
    let USER_URL = "https://jsonplaceholder.typicode.com"
}

struct UserData: Decodable {
    let id : Int
    let name : String
    let username : String
}


class UserConnect {
    
    static let shared : UserConnect = UserConnect()
    
    private var request : DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    let USER_URL = "https://jsonplaceholder.typicode.com"
    func noneFaramsGet(completionHandler: @escaping (Result<[UserData], Error>) -> Void){
        self.request = AF.request("\(USER_URL)/users", method: .get)
    }
}
