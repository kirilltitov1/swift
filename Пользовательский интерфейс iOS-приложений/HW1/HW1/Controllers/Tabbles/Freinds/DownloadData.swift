//
//  DownloadData.swift
//  HW1
//
//  Created by Kirill Titov on 26/10/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift


class DownloadData {
    
    var realm: Realm?
    var addedRealmFriends: Results<FriendRealm>?
    
    func getData() {
        let METHOD_NAME = "/friends.get"
        let PARAMETERS: Parameters = ["fields": "nickname,photo_max_orig",
                                      "access_token": session.token,
                                      "v": session.apiVersion
        ]
        let url = session.vkURL + session.vkMethod + METHOD_NAME
        realm = try! Realm()
        
        Alamofire.request(url, method: .get, parameters: PARAMETERS).responseData {
            response in

                guard let response2 = response.value else { return }

                let friends = User.instance

                do {
                    let freindsItems = try JSONDecoder().decode(UserFriendsModel.self, from: response2)
                    friends.friends = freindsItems.response.items
                } catch {
                    print("\(error)")
                }

                let writeUser = UserRealm()
                                    
                self.realm?.writeAsync(obj: writeUser) { (realm, writeUser) in
                    
                    for friend in friends.friends! {

                        let FriendPars = FriendRealm()
                        FriendPars.id = friend.id
                        FriendPars.last_name = friend.last_name
                        FriendPars.name = friend.first_name
                        FriendPars.online = Int8(friend.online)

                        FriendPars.photo = friend.photo_max_orig
                        
                        writeUser?.friend.append(FriendPars)
                    }
                    
                    try! realm.write {
                        realm.add(writeUser!)
                    }
                    self.addedRealmFriends = realm.objects(FriendRealm.self)
                }
            self.addedRealmFriends = self.realm?.objects(FriendRealm.self)
            }
        
    }
}
