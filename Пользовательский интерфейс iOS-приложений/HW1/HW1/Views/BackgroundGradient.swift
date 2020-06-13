//
//  BackgroundGradient.swift
//  HW1
//
//  Created by Kirill Titov on 16/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class BackgroundGradient: UIView {

    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    var startColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var endColor: UIColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    
    
    var startLocation: CGFloat = 0
    var endLocation: CGFloat = 1
    
    var startPoint: CGPoint = .zero
    var endPoint: CGPoint = CGPoint(x: 0, y: 1)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

}
