//
//  Photo.swift
//  HW1
//
//  Created by Kirill Titov on 23/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


//struct Photo: Codable {
//    let response: PhotoResponse
//}
//
//
//struct PhotoResponse: Codable {
//    let count: Int
//    let items: [PhotoItems]
//}
//
//
//struct PhotoItems: Codable {
//    let id: Int
//    let album_id: Int
//    let owner_id: Int
//    let sizes: [PhotoSize]
//    let text: String
//    let date: Double
//}
//
//
//struct PhotoSize: Codable {
//    let type: String
//    let url: String
//    let width: Int
//    let height: Int
//}


class PhotoResponse: Decodable {
    let response: Response
}


class Response: Decodable {
    let items: [Items]
}


class Items: NSObject, Decodable {
    var text = ""
    var date = 0
    var sizes: [Sizes]?
    
    
    enum MainKeys: String, CodingKey {
        case text
        case date
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let response = try decoder.container(keyedBy: MainKeys.self)
        self.text = try response.decode(String.self, forKey: .text)
        self.date = try response.decode(Int.self, forKey: .date)
    }
}


class Sizes: Codable {
    var type = ""
    var url = ""
    var width = 0
    var height = 0
    
    enum Keys: CodingKey {
        case sizes
    }
    
    enum SizesKyes: CodingKey {
        case type
        case url
        case width
        case height
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()

        
        let values = try decoder.container(keyedBy: Keys.self)
        let sizes = try values.nestedContainer(keyedBy: SizesKyes.self, forKey: .sizes)
        
        self.type = try sizes.decode(String.self, forKey: .type)
        self.url = try sizes.decode(String.self, forKey: .url)
        self.width = try sizes.decode(Int.self, forKey: .width)
        self.height = try sizes.decode(Int.self, forKey: .height)
    }

}

