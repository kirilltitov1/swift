//
//  FreindCell.swift
//  HW1
//
//  Created by Kirill Titov on 25/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class FreindCell: UITableViewCell {
        
    @IBOutlet var label: UILabel!
    @IBOutlet var freindImage: UIImageView!
    @IBOutlet weak var weight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFreind(_ Name: String, _ Image: UIImage) {
        label?.text = Name
        freindImage?.image = Image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label?.text = nil
        self.freindImage?.image = nil
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        freindImage.layer.cornerRadius = freindImage.frame.width/2
        freindImage.clipsToBounds = true
    }
    
    func imageAnimate() {
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.5),
                       initialSpringVelocity: CGFloat(0),
                       options: [],
                       animations: {
                        self.weight.constant = self.freindImage.frame.width/5
                        self.layoutIfNeeded()
        })
    }
    
        
}
