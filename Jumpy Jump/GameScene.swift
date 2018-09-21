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
    var highest = CGFloat(0.0)
    let motionManager = CMMotionManager()
    
    var xAcceleration:CGFloat = 0.0
    var scoreLabel:SKLabelNode!
    var coinLabel:SKLabelNode!
    var jump = true
    
    var currentMaxY:Int!
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
        
        currentMaxY = 80
        
        let platform = createPlatformAtPosition(position: CGPoint(x: 150, y: 50), ofType: PlatformType.normalBrick)
        foreground.addChild(platform)
        
        let platform1 = createPlatformAtPosition(position: CGPoint(x: 250, y: 150), ofType: PlatformType.normalBrick)
        foreground.addChild(platform1)
        
        let platform2 = createPlatformAtPosition(position: CGPoint(x: 180, y: 250), ofType: PlatformType.normalBrick)
        foreground.addChild(platform2)
        
        let coin = createCoinAtPosition(position: CGPoint(x: 15, y: 50), ofType: CoinType.specialCoin)
        foreground.addChild(coin)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        physicsWorld.contactDelegate = self
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates()
        
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
    
    override func didSimulatePhysics() {
        if player.position.x < -20 {
            player.position = CGPoint(x: self.size.width + 20, y: player.position.y)
        }
        else if (player.position.x > self.size.width + 20) {
            player.position = CGPoint(x: 20, y: player.position.y)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.physicsBody?.isDynamic = true
        if jump {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 50))
            jump = false
        }
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            player.physicsBody?.velocity.dx = CGFloat(accelerometerData.acceleration.x * 500)
            //self.xAcceleration = CGFloat(accelerometerData.acceleration.x * 175)
            
        }
        if player.position.y > 150 {
            background.position = CGPoint(x: 0, y: -((player.position.y - 200)))
            foreground.position = CGPoint(x: 0,y: -((player.position.y - 200)))
        }
    }
}
