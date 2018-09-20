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
        playerNode.position = CGPoint(x: self.frame.size.width/2, y: 50)
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
    
    func createPlatformAtPosition (position:CGPoint, ofType type:PlatformType) -> PlatformNode {
        let node = PlatformNode()
        let position = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = position
        node.name = "PLATFORMNODE"
        node.platformType = type
        
        var sprite:SKSpriteNode
        
        if type == PlatformType.normalBrick {
            sprite = SKSpriteNode(imageNamed: "Platform1")
        }
        else {
            sprite = SKSpriteNode(imageNamed: "Platform2")
            
        }
        sprite.setScale(0.7)
        node.addChild(sprite)
        node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 500, height: 5), center: CGPoint(x: position.x, y: position.y-40))
        print(position.x)
        print(self.frame.size.width/2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Brick
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
    
    func createCoinAtPosition (position:CGPoint, ofType type:CoinType) -> CoinNode {
        let node = CoinNode()
        let position = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = position
        node.name = "COINNODE"
        node.coinType = type
        
        var sprite:SKSpriteNode
        
        if type == CoinType.normalCoin {
            sprite = SKSpriteNode(imageNamed: "Coin1")
        }
        else {
            sprite = SKSpriteNode(imageNamed: "Coin2")
            
        }
        node.addChild(sprite)
        node.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Coin
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
}
