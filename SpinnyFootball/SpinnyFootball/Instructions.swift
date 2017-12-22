//
//  Instructions.swift
//  
//
//  Created by Vlad verba  on 7/20/16.
//
//

import Foundation
import SpriteKit

class Instructions: SKScene {
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.white
        
        // add the sprites onto the scene
        
        let football = SKSpriteNode(imageNamed: "FootballSpinny3.png")
        football.position = CGPoint(x: self.size.width / 4, y: self.size.height * 0.80)
        self.addChild(football)
        
        let whistle = SKSpriteNode(imageNamed: "WhistleSpinny.png")
        whistle.size = CGSize(width: 400, height: 400)
        whistle.position = CGPoint(x: self.size.width / 4, y: self.size.height * 0.50)
        self.addChild(whistle)
        
        let checkMark = SKSpriteNode(imageNamed: "Untitled-10.png")
        checkMark.position = CGPoint(x: self.size.width / 1.6, y: self.size.height * 0.80)
        self.addChild(checkMark)
        
        let ex = SKSpriteNode(imageNamed: "Untitled-11.png")
        ex.position = CGPoint(x: self.size.width / 1.6, y: self.size.height * 0.50)
        self.addChild(ex)
        
        let letsPlay = SKSpriteNode(imageNamed: "LetsPlay.png")
        letsPlay.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.20)
        letsPlay.name = "startGame"
        self.addChild(letsPlay)

        
        // add actions to the sprites
        let rotR = SKAction.rotate(byAngle: 4.00, duration: 1.0)
        let cycle = SKAction.sequence([rotR, rotR])
        let wiggle = SKAction.repeatForever(cycle)
        whistle.run(wiggle)
        football.run(wiggle)

        let scaleDown = SKAction.scale(to: 0.3, duration: 1.0)
        let scaleUp = SKAction.scale(to: 1.0, duration: 1.0)
        let scaleCycle = SKAction.sequence([scaleDown, scaleUp])
        let scaling = SKAction.repeatForever(scaleCycle)
        football.run(scaling)
        
        let scaleUpTxt = SKAction.scale(to: 1.5, duration: 0.5)
        checkMark.run(scaleUpTxt)
        ex.run(scaleUpTxt)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let pointOfTouch  = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "startGame" {
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }

    }
}
