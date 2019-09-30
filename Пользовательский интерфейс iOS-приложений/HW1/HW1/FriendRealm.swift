//
//  FriendRealm.swift
//  HW1
//
//  Created by Kirill Titov on 29/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation
import RealmSwift

class FriendRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var photo: Data?
    @objc dynamic var online: Int8 = 0
    
//    это говорит о связи 1 юзер, но много друзей
    @objc dynamic var ownerFriend: UserRealm?
}
