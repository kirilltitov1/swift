//
//  Account.swift
//  HW1
//
//  Created by Kirill Titov on 19/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class Account: UIView {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var counter: UILabel!
    @IBAction func likePressed() {
        counter.text = String(Int(counter.text!)! + 1)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let radius: CGFloat = rect.midX - 10
//        guard let content = UIGraphicsGetCurrentContext() else {return}
        
        self.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath
        myImage.layer.shadowColor = UIColor.darkGray.cgColor
        
        myImage.layer.shadowOffset = CGSize(width: 15.0, height: 15.0)
        myImage.layer.shadowRadius = 50.0
        myImage.layer.shadowOpacity = 0.9
        
        
        self.layer.cornerRadius = self.frame.size.height / 2
        myImage.layer.cornerRadius = myImage.frame.size.width / 2
        myImage.clipsToBounds = true
    }
}
