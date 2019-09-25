//
//  Photo.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class Photo: Codable {
    let response: PhotoResponse
}


class PhotoResponse: Codable {
    let items: [PhotoItems]
}


class PhotoItems: NSObject, Codable {
    var text = ""
    var date = 0
    var sizes: [PhotoSizes] = []
}


class PhotoSizes: Codable {
    var type = ""
    var url = ""
    var width = 0
    var height = 0
}

