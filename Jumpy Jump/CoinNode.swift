//
//  CoinNode.swift
//  Jumpy Jump
//
//  Created by Frank Kou on 9/18/18.
//  Copyright © 2018 Frank Kou. All rights reserved.
//

import SpriteKit

enum CoinType:Int {
    case normalCoin = 0
    case specialCoin = 1
}

class CoinNode: GenericNode {
    var coinType:CoinType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool {
        self.removeFromParent()
        return true
    }
}
