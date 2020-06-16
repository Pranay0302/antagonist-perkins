//
//  GameScene.swift
//  hop
//
//  Created by pranay andra on 16/06/20.
//  Copyright © 2020 pranay andra. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var perkins:SKSpriteNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
    
        
        if let somePlayer: SKSpriteNode = self.childNode(withName: "player") as? SKSpriteNode
        {
            perkins = somePlayer
            perkins.physicsBody?.isDynamic = false
            
        } 
        
        
    }
    
    func moveUp()
    {
        let moveAction: SKAction = SKAction.moveBy(x: 0, y: +50, duration: 0.5)
        perkins.run(moveAction)
    }
    
    func moveDown()
    {
        let moveAction: SKAction = SKAction.moveBy(x: 0, y: -50, duration: 0.5)
        perkins.run(moveAction)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if ( pos.y > 0  && pos.x > 0 )
        {
            moveUp()
        } else
        {
            moveDown()
        }
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {
        if ( pos.x < 0 && pos.y < 0)
        {
            moveDown()
        } else
        {
            moveUp()
        }
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
            break
        }
        }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
