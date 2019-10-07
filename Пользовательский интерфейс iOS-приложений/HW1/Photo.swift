//
//  Photo.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation
import RealmSwift


class Photo: Codable {
    var response: PhotoResponse
}


class PhotoResponse: Codable {
    var items: [PhotoItems]
}


class PhotoItems: Codable {
    var text = ""
    var date = 0
    var sizes: [PhotoSizes] = []
    var sizesRealm: [PhotoSizes] = [PhotoSizes()]
    
//    convenience required init(from decoder: Decoder) throws {
//        self.init()
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        for size in sizes {
//            sizesRealm?.append(size)
//        }
//    }
    
//    override class func ignoredProperties() -> [String] {
//        return ["sizes"]
//    }
}


class PhotoSizes: Codable {
    var type = ""
    var url = ""
    var width = 0
    var height = 0
}

