//
//  GameScene.swift
//  Jumpy Jump
//
//  Created by Frank Kou on 9/5/18.
//  Copyright © 2018 Frank Kou. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    
    var hud:SKNode!
    var player:SKNode!
    var scaleFactor:CGFloat!
    //var startButton = SKSpriteNode(imageNamed: )
    
    var endOfGamePosition = 0
    let motionManager = CMMotionManager()
    
    var xAcceleration:CGFloat = 0.0
    var scoreLabel:SKLabelNode!
    var coinLabel:SKLabelNode!
    
    var playerMaxY:Int!
    var gameOver = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        scaleFactor = self.size.width / 320
        
        background = createBackground()
        addChild(background)
        
        foreground = SKNode()
        addChild(foreground)
        
        player = createPlayer()
        foreground.addChild(player)
        
        let platform = createPlatformAtPosition(position: CGPoint(x: self.frame.size.width/2, y: 100), ofType: PlatformType.normalBrick)
        foreground.addChild(platform)
        
        let coin = createCoinAtPosition(position: CGPoint(x: 15, y: 50), ofType: CoinType.specialCoin)
        foreground.addChild(coin)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var otherNode:SKNode!
        
        if contact.bodyA.node != player {
            otherNode = contact.bodyA.node
        }
        else {
            otherNode = contact.bodyB.node
        }
        
        (otherNode as! GenericNode).collisionWithPlayer(player: player)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.physicsBody?.isDynamic = true
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 170))
        }

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
