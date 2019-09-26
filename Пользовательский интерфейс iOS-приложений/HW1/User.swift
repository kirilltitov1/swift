//
//  User.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class User: Codable {
    let freinds: UserFreinds

}


class UserFreinds: Codable {
    var response: FreindsResponse
}


class FreindsResponse: Codable {
    var items: [FreindsItems]
}


class FreindsItems: Codable {
    var first_name: String
    var last_name: String
    var photo_max_orig: String
    var online: Int
}
