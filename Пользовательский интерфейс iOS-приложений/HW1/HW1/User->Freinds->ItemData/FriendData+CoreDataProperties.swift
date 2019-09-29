//
//  FriendData+CoreDataProperties.swift
//  HW1
//
//  Created by Kirill Titov on 29/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendData> {
        return NSFetchRequest<FriendData>(entityName: "FriendData")
    }

    @NSManaged public var online: Int16
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var photo: Data?
    @NSManaged public var user: UserData?

}
