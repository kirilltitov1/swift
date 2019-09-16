//
//  TopNewsCell.swift
//  HW1
//
//  Created by Kirill Titov on 30/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class TopNewsCell: UICollectionViewCell {

    @IBOutlet weak var imageFreind: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageFreind?.image = nil
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        imageFreind.layer.cornerRadius = imageFreind.frame.width/2
        imageFreind.clipsToBounds = true
    }
    
    
    func setColorFromCell(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    
    func setFreind(_ Image: UIImage) {
        imageFreind?.image = Image
    }
    
}
