//
//  Photo.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


struct Photo: Codable {
    var count: Int
    var items: [Items]
}


struct Items: Codable {
    var id: Int
    var album_id: Int
    var owner_id: Int
    var sizes: [Size]
    var text: String
    var date: Double
}


struct Size: Codable {
    var type: String
    var url: String
    var width: Int
    var height: Int
}
