//
//  NewsVC+.swift
//  HW1
//
//  Created by Kirill Titov on 16/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

extension NewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.setColorFromCell(color[indexPath.row])

        return cell
    }

}
