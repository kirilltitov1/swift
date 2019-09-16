//
//  TableViewCell.swift
//  HW1
//
//  Created by Kirill Titov on 16/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setColorFromCell(_ colorCell: UIColor) {
        self.imageV?.backgroundColor = colorCell
    }
}
