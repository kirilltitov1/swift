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
    
    
    func arrayContains(needle: String, arrhaystack: [String]) -> Bool{
        return arrhaystack.contains(needle);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? FreindsTableVC {
                vc.delegate = self
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return addedFreinds.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedFreinds[section].count-1
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedFreindCell", for: indexPath) as! AddedCell

        if addedFreinds[indexPath.section].count > 1 {
            cell.setFreind(addedFreinds[indexPath.section][indexPath.row+1], UIImage(named: addedFreinds[indexPath.section][indexPath.row+1])!)
        }

        return cell
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
                    
                    self.tableView.reloadData()
                    
                    break
                }
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //        че то я не понял как сделать полупрозрачность
        //        tableView.layer.backgroundColor?.alpha.
        
        if addedFreinds[section].count == 1 {
            return nil
        } else {
            return addedFreinds[section][0]
        }
    }
    
}
