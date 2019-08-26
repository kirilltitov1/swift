//
//  AddedFreindsTabelVC.swift
//  HW1
//
//  Created by Kirill Titov on 18/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class AddedFreindsTabelVC: UITableViewController {

    var addedFreinds: [[String]] = [["A"], ["B"], ["C"], ["D"], ["E"], ["F"], ["G"], ["H"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N"], ["O"], ["P"], ["Q"], ["R"], ["S"], ["T"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
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

        cell.setFreind(addedFreinds[indexPath.section][indexPath.row+1], UIImage(named: addedFreinds[indexPath.section][indexPath.row+1])!)

        return cell
    }
}

extension AddedFreindsTabelVC: FreindsTableVCDelegate {
    func vc(_ vc: FreindsTableVC, didSelectFreind freind: String) {
// не понимаю как сдесь реализовать логику добавления друзей, я хотел бы что бы друг добавлялся и потом сортировалася подмассив в который был добавлен друг оно работает если сделать не массив массивов а простой массив я проверял 
//        for i in 0...addedFreinds.count {
//            if Character(addedFreinds[i][0]) == freind[0] {
//
//            }
//        }
//        addedFreinds.append(freind)
        tableView.reloadData()
    }
}
