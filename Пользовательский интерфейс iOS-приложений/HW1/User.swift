//
//  User.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class User: Codable {
    static var instance = User()
    
    var friends: [FriendsItems]?
    
    private init(){}
}


class UserFriendsModel: Codable {
    var response: FriendsResponse
}


class FriendsResponse: Codable {
    var items: [FriendsItems]
}


class FriendsItems: Codable {
    var first_name: String
    var last_name: String
    var photo_max_orig: String
    var online: Int
    var id: Int
}


//class FreindsResponse2: Decodable {
//    class FreindsItems2: Decodable {
//        var first_name: String
//        var last_name: String
//        var photo_max_orig: String
//        var online: Int
//
//        enum items: CodingKey {
//            case first_name
//            case last_name
//            case photo_max_orig
//            case online
//        }
//
//
//        required convenience init(from decoder: Decoder) throws {
////            как я думаю я получаю здесь просто весь контейнер с JSON
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
////            тут я опускаюсь в response
//            let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
//
////            из response я получаю данные для массива items
//            let items = try response.decode([FreindsItems2].self, forKey: )
//
//            self.init(from: items)
//
//        }
//    }
//
//    enum CodingKeys: CodingKey {
//        case count
//        case items
//        case response
//    }
//}
