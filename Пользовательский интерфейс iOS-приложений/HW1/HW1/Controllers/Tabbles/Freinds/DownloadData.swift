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


class DownloadData: Thread {
    
    var realm: Realm?
    var addedRealmFriends: Results<FriendRealm>?
    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
        
    override func main() {
        
        RunLoop.current.run()
        
        let METHOD_NAME = "/friends.get"

        let PARAMETERS: Parameters = ["fields": "nickname,photo_max_orig",
                                      "access_token": session.token,
                                      "v": session.apiVersion
        ]

        let url = session.vkURL + session.vkMethod + METHOD_NAME


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

            let User = UserRealm()
                            
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

            let realm = try! Realm(configuration: config)
            realm.beginWrite()


            for friend in friends.friends! {
                let FriendPars = FriendRealm()
                FriendPars.id = friend.id
                FriendPars.last_name = friend.last_name
                FriendPars.name = friend.first_name
                FriendPars.online = Int8(friend.online)
                
                FriendPars.photo = try! Data.init(contentsOf: URL(string: friend.photo_max_orig)!)

                User.friend.append(FriendPars)

                realm.add(User)
            }

            do {
                try realm.commitWrite()
            } catch {
                print("\(error)")
            }
            self.addedRealmFriends = realm.objects(FriendRealm.self)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
