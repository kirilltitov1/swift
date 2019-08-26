//
//  Cell.swift
//  HW1
//
//  Created by Kirill Titov on 18/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var freindImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFreind(_ Name: String, _ Image: UIImage) {
        label?.text = Name
        freindImage?.image = Image
    }

}
