//
//  FreindsTableVC.swift
//  HW1
//
//  Created by Kirill Titov on 17/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

protocol FreindsTableVCDelegate {
    func vc(_ vc: FreindsTableVC, didSelectFreind freind: String)
}

class FreindsTableVC: UITableViewController {

    var delegate: FreindsTableVCDelegate?
    
    var arrENFreindsList: [[String]] = [["A"], ["B"], ["C", "Casper"], ["D", "Dinosaur"], ["E"], ["F"], ["G"], ["H", "Hare"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N", "Narwhal"], ["O"], ["P", "Pikachu", "PolarBear"], ["Q"], ["R"], ["S"], ["T", "Tiger"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "FreindCell", bundle: nil), forCellReuseIdentifier: "freindCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrENFreindsList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrENFreindsList[section].count-1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "freindCell") as! FreindCell
        
        cell.setFreind(arrENFreindsList[indexPath.section][indexPath.row+1], UIImage(named: arrENFreindsList[indexPath.section][indexPath.row+1])!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "freindCell") as! FreindCell
        
        cell.imageAnimate()
        
        let freind = arrENFreindsList[indexPath.section][indexPath.row+1]
        delegate?.vc(self, didSelectFreind: freind)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        че то я не понял как сделать полупрозрачность
//        tableView.layer.backgroundColor?.alpha.
        
        if arrENFreindsList[section].count == 1 {
            return nil
        } else {
            return arrENFreindsList[section][0]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
