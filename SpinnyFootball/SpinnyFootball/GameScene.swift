//
//  GameScene.swift
//  SpinnyFootball
//
//  Created by Vlad verba  on 7/7/16.
//  Copyright (c) 2016 TapTapPlay. All rights reserved.
//

import Foundation
import SpriteKit

var scoreNumber = 0

class GameScene: SKScene {
    
    var saying1 = SKLabelNode(fontNamed: "Avenir-Black")
    var saying2 = SKLabelNode(fontNamed: "Avenir-Black")
    var saying3 = SKLabelNode(fontNamed: "Avenir-Black")
    var saying4 = SKLabelNode(fontNamed: "Avenir-Black")
    
    var duration = 3.5
    
    let scoreLabel = SKLabelNode(fontNamed: "Avenir-Black")
    
    let playCorrectSoundEffect = SKAction.playSoundFileNamed("BloopForFootball.wav", waitForCompletion: false)
    let playGameOverSoundEffect = SKAction.playSoundFileNamed("GameOverSpinnyFootball.wav", waitForCompletion: false)
    
    let gameArea: CGRect
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(_ min: CGFloat, max: CGFloat) -> CGFloat {
        
        return random() * (max - min) + min
        
    }
    
    
    override func didMove(to view: SKView) {
        
        
        _ = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(GameScene.spawnWhistle), userInfo: nil, repeats: true)
        
        scoreNumber = 0
        
        // set up background and add it to the scene
        let background = SKSpriteNode(imageNamed: "BackgroundWhack3.png")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        // set up disc 2
        let disc = SKSpriteNode(imageNamed: "FootballSpinny2.png")
        disc.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        disc.zPosition = 2
        disc.name = "discObject"
        
        // set up actions for rotations
        let rotR = SKAction.rotate(byAngle: 4.00, duration: 1.0)
        let cycle = SKAction.sequence([rotR, rotR])
        let wiggle = SKAction.repeatForever(cycle)
        disc.run(wiggle)
        
        self.addChild(disc)
        
        // set up label
        scoreLabel.fontSize = 200.0
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.75)
        addChild(scoreLabel)
        
        saying2.fontSize = 200.0
        saying2.text = "keep it up"
        saying2.fontColor = SKColor.yellow
        saying2.zPosition = 5
        saying2.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.25)
        
        saying3.fontSize = 200.0
        saying3.text = "hike hike"
        saying3.fontColor = SKColor.yellow
        saying3.zPosition = 5
        saying3.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.25)
        
        saying4.fontSize = 200.0
        saying4.text = "let's go team"
        saying4.fontColor = SKColor.yellow
        saying4.zPosition = 5
        saying4.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.25)
        
        saying1.fontSize = 200.0
        saying1.text = "nice start!"
        saying1.fontColor = SKColor.yellow
        saying1.zPosition = 5
        saying1.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.25)
    }
    
    func spawnWhistle(){
        
        let whistle = SKSpriteNode(imageNamed: "WhistleSpinny.png")
        whistle.zPosition = 1
        whistle.name = "whistleObject"
        
        // get a random X
        let randomX = random(gameArea.minX + whistle.size.width / 2 , max: gameArea.maxX - whistle.size.width / 2)
        // get a random Y
        let randomY = random(gameArea.minY + whistle.size.height / 2 , max: gameArea.maxY - whistle.size.height / 2)
        
        whistle.position = CGPoint(x: randomX, y: randomY)
        
        let move = SKAction.move(to: CGPoint(x: self.size.width / 2, y: self.size.height / 2), duration: 3.0)
        whistle.run(move)
        
        // set up actions for rotations
        let rotR = SKAction.rotate(byAngle: 4.00, duration: 1.0)
        let cycle = SKAction.sequence([rotR, rotR])
        let wiggle = SKAction.repeatForever(cycle)
        whistle.run(wiggle)
        
        self.addChild(whistle)
        
        whistle.run(SKAction.sequence([
            SKAction.scale(to: 0.0, duration: 4.0),
            ]))
        
    }
    
    
//    func spawnWatch(){
//
//        let watch = SKSpriteNode(imageNamed: "PocketWatch.png")
//        watch.size = CGSize(width: 500, height: 500)
//        watch.zPosition = 2
//        watch.name = "watchObject"
//        
//        // get a random X
//        let randomX = random(min: CGRectGetMinX(gameArea) + watch.size.width / 2 , max: CGRectGetMaxX(gameArea) - watch.size.width / 2)
//        // get a random Y
//        let randomY = random(min: CGRectGetMinY(gameArea) + watch.size.height / 2 , max: CGRectGetMaxY(gameArea) - watch.size.height / 2)
//        
//        watch.position = CGPoint(x: randomX, y: randomY)
//        
//        // set up actions for rotations
//        let rotR = SKAction.rotateByAngle(4.00, duration: 1.0)
//        let cycle = SKAction.sequence([rotR, rotR])
//        let wiggle = SKAction.repeatActionForever(cycle)
//        watch.runAction(wiggle)
//        
//        self.addChild(watch)
//        
//        watch.runAction(SKAction.sequence([
//            SKAction.scaleTo(0.0, duration: 3.0),
//            ]))
//        
//    }

    
    func spawnNewDisk(){
        
        var randomImageNumber = arc4random()%6
        randomImageNumber += 1
        
        let disc = SKSpriteNode(imageNamed: "FootballSpinny\(randomImageNumber)")
        disc.zPosition = 2
        disc.name = "discObject"
        
        // get a random X
        let randomX = random(gameArea.minX + disc.size.width / 2 , max: gameArea.maxX - disc.size.width / 2)
        // get a random Y
        let randomY = random(gameArea.minY + disc.size.height / 2 , max: gameArea.maxY - disc.size.height / 2)
        
        disc.position = CGPoint(x: randomX, y: randomY)
        
        // set up actions for rotations
        let rotR = SKAction.rotate(byAngle: 4.00, duration: 1.0)
        let cycle = SKAction.sequence([rotR, rotR])
        let wiggle = SKAction.repeatForever(cycle)
        disc.run(wiggle)
        
        self.addChild(disc)
        
        disc.run(SKAction.sequence([
            SKAction.scale(to: 0.0, duration: duration),
            SKAction.run(runGameOver)
            ]))
        
    }
    
    // what happens when game over
    func runGameOver(){
        
        var randomImageNumber = arc4random()%2
        print(randomImageNumber)
        
        if (randomImageNumber == 1) {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShowInterAd"), object: nil)
            
        }

        
        self.run(playGameOverSoundEffect)

        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            // set your touch to the position of where youve touched the screen
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            // if you tap on the disc remove the disc
            if (nameOfTappedNode == "discObject") {
                
                tappedNode.name = ""
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.2),
                    SKAction.removeFromParent()
                    ]))
                
                // play sound when disc deletes
                self.run(playCorrectSoundEffect)
                
                
                spawnNewDisk()
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
                
                // as score gets higher add more discs
                if scoreNumber == 20 || scoreNumber == 50 || scoreNumber == 125 || scoreNumber == 200 || scoreNumber == 300 || scoreNumber == 500 {
                    spawnNewDisk()
                    spawnWhistle()
                }
                
                if (scoreNumber == 20){
                
                    self.addChild(saying1)
                    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
                    saying1.run(fadeOut)
                    
                    let grow = SKAction.scale(by: 2, duration: 0.7)
                    saying1.run(grow)
                
                }
                
                if (scoreNumber == 50){
                    
                    self.addChild(saying2)
                    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
                    saying2.run(fadeOut)
                    
                    let grow = SKAction.scale(by: 2, duration: 0.7)
                    saying2.run(grow)
                    
                }
                
                if (scoreNumber == 125){
                    
                    self.addChild(saying3)
                    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
                    saying3.run(fadeOut)
                    
                    let grow = SKAction.scale(by: 2, duration: 0.7)
                    saying3.run(grow)
                    
                }
                
                if (scoreNumber == 200){
                    
                    self.addChild(saying4)
                    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
                    saying4.run(fadeOut)
                    
                    let grow = SKAction.scale(by: 2, duration: 0.7)
                    saying4.run(grow)
                    
                }
                
                
            }
            
//            if (nameOfTappedNode == "watchObject") {
//                        
//                tappedNode.name = ""
//                tappedNode.removeAllActions()
//                
//                tappedNode.runAction(SKAction.sequence([
//                    SKAction.fadeOutWithDuration(0.2),
//                    SKAction.removeFromParent()
//                    ]))
//
//
//            }
            
            if (nameOfTappedNode == "whistleObject") {
                
                
                tappedNode.name = ""
                tappedNode.removeAllActions()
                
                runGameOver()
                
            }

            
            
            
        }
        
        
    }
    
}
