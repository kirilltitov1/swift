//
//  MoreList.swift
//  HW1
//
//  Created by Kirill Titov on 13/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

var dateForMore: [String] = ["Ur profile", "Freinds", "Community", "Music", "Bookmarks", "Photo", "Video", "Broadcasts", "Liked", "Podcasts", "Documents", "Money transfers", "Help"]


class MoreList: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateForMore.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: dateForMore[indexPath.row])
        
        cell.textLabel?.text = dateForMore[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dateForMore[indexPath.row] == "Freinds" {
//      как исправить этот варнинг ?
            let viewController = storyboard?.instantiateViewController(withIdentifier: "freindsListVC")
        self.present(viewController!, animated: true)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AfterMoreSegue" {
            if let indexRow = self.tableView.indexPathForSelectedRow {
                let ForMoreClasses = segue.destination as! ForMoreClasses
                ForMoreClasses.MoreTitle = dateForMore[indexRow.row]
            }
        }
    }
}
