//
//  GenericNode.swift
//  Jumpy Jump
//
//  Created by Frank Kou on 9/10/18.
//  Copyright © 2018 Frank Kou. All rights reserved.
//

import SpriteKit

struct CollisionBitMask {
    static let Player:UInt32 = 0x00
    static let Coin:UInt32 = 0x01
    static let Brick:UInt32 = 0x02
}

enum PlatformType:Int {
    case normalBrick = 0
    case breakableBrick = 1
}

class GenericNode: SKNode {
    func collisionWithPlayer (player:SKNode) -> Bool {
        return false
    }
    
    func shouldRemoveNode (playerY:CGFloat) {
        if playerY > self.position.y + 300 {
            self.removeFromParent()
        }
    }
}
