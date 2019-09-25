//
//  Group.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


struct Group: Codable {
    let response: GroupResponse
}


struct GroupResponse: Codable {
    let count: Int
    let items: [Int]
}


class GroupClass {
    let count: Int
    let items: [Int]
    
    init(count: Int, items: [Int]) {
        self.count = count
        self.items = items
    }
}
