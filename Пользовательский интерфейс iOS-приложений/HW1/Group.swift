//
//  Group.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class Group: Codable {
    var response: GroupResponse
}


class GroupResponse: NSObject, Codable {
    var count = 0
    var items: [Int] = []
    
    enum Main: String, CodingKey {
        case count = "count"
        case items = "items"
    }
}

