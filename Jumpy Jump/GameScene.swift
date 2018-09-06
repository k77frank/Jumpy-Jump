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

class GameScene: SKScene {
    
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
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        }

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
