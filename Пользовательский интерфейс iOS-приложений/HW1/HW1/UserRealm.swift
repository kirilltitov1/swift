//
//  UserRealm.swift
//  HW1
//
//  Created by Kirill Titov on 29/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    dynamic var friend = List<FriendRealm>()
}
