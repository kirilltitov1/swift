//
//  Group.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class Group: Codable {
    let response: GroupResponse
}


class GroupResponse: NSObject, Codable {
    let count = 0
    let items: [Int] = []
}

