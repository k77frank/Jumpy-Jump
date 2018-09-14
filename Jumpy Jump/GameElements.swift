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
    
    func createPlayer() -> SKNode {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: 100, y: 0)
        let sprite = SKSpriteNode(imageNamed: "doodle")
        sprite.setScale(0.5)
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        playerNode.physicsBody?.isDynamic = false
        playerNode.physicsBody?.allowsRotation = false
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        
        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.Player
        
        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.Coin | CollisionBitMask.Brick
        
        return playerNode
    }
    
    //func createPlatformAtPosition (position) 
}
