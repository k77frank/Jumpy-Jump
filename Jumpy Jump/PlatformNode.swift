//
//  PlatformNode.swift
//  Jumpy Jump
//
//  Created by Frank Kou on 9/13/18.
//  Copyright © 2018 Frank Kou. All rights reserved.
//

import SpriteKit

class PlatformNode: GenericNode {
    var platformType:PlatformType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool {
        var down:Int
        down = Int((player.physicsBody?.velocity.dy)!)
        if (down <= 0) && (player.position.y > self.position.y) {
            
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 350)
            
            if platformType == PlatformType.breakableBrick {
                self.removeFromParent()
            }
        }
        return false
    }
}
