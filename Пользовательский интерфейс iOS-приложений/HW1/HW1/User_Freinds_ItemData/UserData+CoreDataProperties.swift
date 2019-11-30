//
//  UserData+CoreDataProperties.swift
//  HW1
//
//  Created by Kirill Titov on 29/11/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var friend: Data?
    @NSManaged public var friends: NSSet?

}

// MARK: Generated accessors for friends
extension UserData {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendData)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendData)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
