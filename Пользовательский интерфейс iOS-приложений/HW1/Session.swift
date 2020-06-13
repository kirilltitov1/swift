//
//  Session.swift
//  HW1
//
//  Created by Kirill Titov on 15/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class Session {
    var login: String = "Titov Kirill"
    var password: String = "qwerty12345"
    var token: String = ""
    var userId: Int = 0
    var apiVersion = "5.101"
    var vkMethod = "/method"
    var vkURL = "https://api.vk.com"
    
    static let instance = Session()
    
    private init(){}
}
