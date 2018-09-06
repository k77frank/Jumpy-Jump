//
//  GameElements.swift
//  Jumpy Jump
//
//  Created by Frank Kou on 9/5/18.
//  Copyright © 2018 Frank Kou. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func createBackground() -> SKNode {
        let background = SKNode()
        for i in 0...3 {
            let backgroundNode = SKSpriteNode(imageNamed: "background")
            backgroundNode.name = "ground"
            backgroundNode.size = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
            backgroundNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            backgroundNode.position = CGPoint(x: backgroundNode.size.width / 2, y: CGFloat(i) * backgroundNode.size.height)
            
            background.addChild(backgroundNode)
        }
        return background
    }
    
    func createMidground() -> SKNode {
        
    }
}
