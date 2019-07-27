//
//  EdgeBody.swift
//  game_snake
//
//  Created by Kirill Titov on 17/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import Foundation
import SpriteKit

class EdgeBody: SKShapeNode {
    
    convenience init(position: CGPoint){
        
        self.init()
        
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.scene!.frame.maxX, height: view.scene!.frame.maxY)).cgPath
        
        
        strokeColor = UIColor.gray
        
        lineWidth = 5
        
        self.position = position
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: view.scene!.frame.maxX, height: view.scene!.frame.maxX), center: CGPoint(x: 0, y: 0))
        
        self.physicsBody?.categoryBitMask = collisionCategories.EdgeBody
        
        
    }
    
    
    
}
