//
//  AddedFreindsTabelVC.swift
//  HW1
//
//  Created by Kirill Titov on 18/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import RealmSwift

protocol AddedFreindsTableVCDelegate {
    var freindsCount: Int { get set }
}

class AddedFreindsTabelVC: UITableViewController {
    @IBOutlet weak var height: NSLayoutConstraint!
    
//    var userHolder = []
    var realm: Realm?
    
    var delegate: AddedFreindsTableVCDelegate?

    var addedFreinds: [[String]] = [["A"], ["B"], ["C"], ["D"], ["E"], ["F"], ["G"], ["H"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N"], ["O"], ["P"], ["Q"], ["R"], ["S"], ["T"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
    var freindsCount = 0
    
    func arrayContains(needle: String, arrhaystack: [String]) -> Bool{
        return arrhaystack.contains(needle);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNameFriendsList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FreindsTableVC {
            vc.delegate = self
        }
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return addedFreinds.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedFreindCell", for: indexPath) as! AddedCell

        if addedFreinds[indexPath.section].count > 1 {
            cell.setFreind(addedFreinds[indexPath.section][indexPath.row+1], UIImage(named: addedFreinds[indexPath.section][indexPath.row+1])!)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: {
                        
        })
    }
}


extension AddedFreindsTabelVC: FreindsTableVCDelegate {
    func vc(_ vc: FreindsTableVC, didSelectFreind freind: String) {
        // мне кажется моя реализация выглядит оч костыльно аименно 58 строка сравнение 2 строк не понимаю поч не сравнивается через ==
        for i in 0...addedFreinds.count-1 {
            if addedFreinds[i][0].first == freind.first {
                if arrayContains(needle: freind, arrhaystack: addedFreinds[i]) == false {
                    
                    addedFreinds[i].append(freind)
                    addedFreinds[i].sort()
                    
                    freindsCount += 1
                    
                    self.tableView.reloadData()
                    
                    break
                }
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //        че то я не понял как сделать полупрозрачность
//                tableView.layer.backgroundColor?.alpha = 0.5
        
        if addedFreinds[section].count == 1 {
            return nil
        } else {
            return addedFreinds[section][0]
        }
    }
}


extension AddedFreindsTabelVC {
    
    func loadNameFriendsList() {
           let METHOD_NAME = "/friends.get"

           let PARAMETERS: Parameters = ["fields": "nickname,photo_max_orig",
                                         "access_token": session.token,
                                         "v": session.apiVersion
           ]
           
           let url = session.vkURL + session.vkMethod + METHOD_NAME
           
           Alamofire.request(url, method: .get, parameters: PARAMETERS).responseData {response in
               
               guard let response2 = response.value else { return }
               
               do {
                let friends = User.instance

                let freindsItems = try JSONDecoder().decode(UserFriendsModel.self, from: response2)
                friends.friends = freindsItems.response.items
                
                
//                if let friend = NSEntityDescription.insertNewObject(forEntityName: "FriendData", into: NSManagedObject(context: FriendData)) as? FriendData {
//                    return
//                }

                
                func createData() {
                    
                    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

//                  вот здесь в контексте он выкидывает ошибку "Failed to load model named HW1"
                    let context = appDelegate.persistentContainer.viewContext
                    
//                  здесь происходит краш An NSManagedObject of class 'HW1.UserData' must have a valid NSEntityDescription.'
                    let user = UserData(context: context)
                    
                    for i in friends.friends! {

                        let friend = FriendData(context: context)
                        
                        friend.name = "\(i.first_name)"
                        friend.surname = "\(i.last_name)"
//                      тут он поч то ругается на преобразование Data
//                        friend.photo = try! Data.init(contentsOf: URL(string: i.photo_max_orig)!) as NSDate
                        friend.online = Int16(i.online)
                        
                        user.addToFriends(friend)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                }
//                createData()
                
                
                func createRealmData() {
//                    создаю сущность юзер для заполнения
                    let User = UserRealm()
                    let FriendPars = FriendRealm()
                    
                    FriendPars.ownerFriend = User
//                    создаю сущность Realm для дольнейшей записи(не смог обраить в docatch)
                    let realm = try! Realm()
                    
                    for friend in friends.friends! {
//                        циклически создаю новую сущность друга для парсинга(можно ли не создавать новую? проверить!)
//                        переопределяю значения сущности для записи в бд
                        FriendPars.id = friend.id
                        FriendPars.last_name = friend.last_name
                        FriendPars.name = friend.first_name
                        FriendPars.online = Int8(friend.online)
                        FriendPars.photo = nil
                        User.friend = FriendPars
                        
                        try! realm.write() {
                            
                            
                            User.friend = FriendPars
                            self.realm?.add(User)
                        }
                    }
                    
                }
                createRealmData()

                print(friends.friends![0].photo_max_orig)
               } catch {
                   print(error)
               }
           }
       }
}
