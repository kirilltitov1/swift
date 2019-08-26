//
//  AddedFreindsTabelVC.swift
//  HW1
//
//  Created by Kirill Titov on 18/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class AddedFreindsTabelVC: UITableViewController {

    var addedFreinds: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? FreindsTableVC {
                vc.delegate = self
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedFreinds.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedFreindCell", for: indexPath) as! AddedCell

        cell.setFreind(addedFreinds[indexPath.row], UIImage(named: addedFreinds[indexPath.row])!)

        return cell
    }
}

extension AddedFreindsTabelVC: FreindsTableVCDelegate {
    func vc(_ vc: FreindsTableVC, didSelectFreind freind: String) {
        addedFreinds.append(freind)
        tableView.reloadData()
    }
}
