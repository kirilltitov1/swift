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
    
    var freindsList: [String] = ["Casper", "Dinosaur", "Hare", "Narwhal", "Pikachu", "PolarBear", "Tiger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freindsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FreindCell") as! Cell
        
        cell.setFreind(freindsList[indexPath.row], UIImage(named: freindsList[indexPath.row])!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let freind = freindsList[indexPath.row]
        delegate?.vc(self, didSelectFreind: freind)
        self.navigationController?.popViewController(animated: true)
    }
}
