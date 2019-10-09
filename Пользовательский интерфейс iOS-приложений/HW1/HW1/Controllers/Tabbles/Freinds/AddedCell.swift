//
//  AddedCell.swift
//  HW1
//
//  Created by Kirill Titov on 18/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class AddedCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var freindImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setFreind(_ Name: String, _ Data: Data) {
        label?.text = Name
        freindImage?.image = UIImage(data: Data)
    }
    
}
