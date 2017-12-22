//
//  GameOverScene.swift
//  SpinnyFootball
//
//  Created by Vlad verba  on 7/7/16.
//  Copyright © 2016 TapTapPlay. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)

    
    override func didMove(to view: SKView) {

        
        self.backgroundColor = UIColor.white
        
        // set up game over label
        let gameOverLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 140
        gameOverLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.80)
        gameOverLabel.fontColor = SKColor.red
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let flashOut = SKAction.fadeOut(withDuration: 0.5)
        let flashIn = SKAction.fadeIn(withDuration: 0.6)
        let cycle = SKAction.sequence([flashOut, flashIn, flashOut, flashIn])
        let wiggle = SKAction.repeatForever(cycle)
        gameOverLabel.run(wiggle)
        
        // what score did you get?
        let finalScoreLabel = SKLabelNode(fontNamed: "HelveticaNeue")
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 70
        finalScoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.70)
        finalScoreLabel.fontColor = SKColor.blue
        finalScoreLabel.zPosition = 1
        self.addChild(finalScoreLabel)
        
        // high score
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if scoreNumber > highScoreNumber {
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        // high score label
        let highScoreLabel = SKLabelNode(fontNamed: "HelveticaNeue")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 70
        highScoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.60)
        highScoreLabel.fontColor = SKColor.blue
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        // retsart label
        let restart = SKSpriteNode(imageNamed: "NFL-Retry.png")
        restart.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.40)
        restart.zPosition = 2
        restart.name = "restartButton"
        self.addChild(restart)
        
        // exit label
        let exit = SKLabelNode(fontNamed: "AmericanTypewriter")
        exit.text = "Home"
        exit.fontSize = 70
        exit.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.10)
        exit.fontColor = SKColor.blue
        exit.zPosition = 1
        exit.name = "exitButton"
        self.addChild(exit)
        
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch  = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "restartButton" {
                self.run(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "exitButton" {
                self.run(clickSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            
            
            
            
            
            
        }
    }
    
    
}
