//
//  MainMenuScene.swift
//  SpinnyFootball
//
//  Created by Vlad verba  on 7/7/16.
//  Copyright © 2016 TapTapPlay. All rights reserved.
//

import Foundation
import SpriteKit
import GoogleMobileAds 

class MainMenuScene: SKScene {
    
//    let notif = UILocalNotification()


    override func didMove(to view: SKView) {
        
//        let background = SKSpriteNode(imageNamed: "WhackMainMenuBackground.png")
//        background.size = self.size
//        background.zPosition = 0
//        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
//        self.addChild(background)
        
        self.backgroundColor = UIColor.white
        
        let spinnyBall = SKSpriteNode(imageNamed: "SpinnyFootballLogo2.png")
        spinnyBall.size = CGSize(width: 1000.0, height: 500.0)
        spinnyBall.position = CGPoint(x: self.size.width * 0.50, y: self.size.height * 0.80)
        spinnyBall.zPosition = 1
        self.addChild(spinnyBall)
        
        let instructions = SKSpriteNode(imageNamed: "HowToSpinny.png")
        instructions.size = CGSize(width: 150.0, height: 150.0)
        instructions.name = "instructions"
        instructions.position = CGPoint(x: self.size.width * 0.50, y: self.size.height * 0.20)
        instructions.zPosition = 1
        self.addChild(instructions)
//
//        let share = SKSpriteNode(imageNamed: "ShareButtonWhack.png")
//        share.size = CGSize(width: 200.0, height: 200.0)
//        share.name = "shareScore"
//        share.position = CGPoint(x: self.size.width * 0.60, y: self.size.height * 0.20)
//        share.zPosition = 1
//        self.addChild(share)
        
        let start = SKSpriteNode(imageNamed: "PlayHelmet.png")
        start.size = CGSize(width: 700.0, height: 700.0)
        start.name = "begin"
        start.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.50)
        start.zPosition = 1
        self.addChild(start)
        
        let rotR = SKAction.rotate(byAngle: 0.4, duration: 0.3)
        let rotL = SKAction.rotate(byAngle: -0.4, duration: 0.3)
        let wait = SKAction.wait(forDuration: 1.0)
        let cycle = SKAction.sequence([rotR, rotL, rotR, rotL, wait])
        let wiggle = SKAction.repeatForever(cycle)
        start.run(wiggle)
        
        

        

        
    }
    
    
    
    
//    /* Time and timezone settings */
//    notification.fireDate = NSDate(timeIntervalSinceNow: 8.0)
//    notification.repeatInterval = NSCalendarUnit.Day
//    notification.timeZone = NSCalendar.currentCalendar().timeZone
//    notification.alertBody = "A new item is downloaded."
//    
//    /* Action settings */
//    notification.hasAction = true
//    notification.alertAction = "View"
//    
//    /* Badge settings */
//    notification.applicationIconBadgeNumber =
//    UIApplication.sharedApplication().applicationIconBadgeNumber + 1
//    /* Additional information, user info */
//    notification.userInfo = [
//    "Key 1" : "Value 1",
//    "Key 2" : "Value 2"
//    ]
//    
//    /* Schedule the notification */
//    UIApplication.sharedApplication().scheduleLocalNotification(notification)
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch  = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "begin" {
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "instructions" {
                
                let sceneToMoveTo = Instructions(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
        }
    }
    
    
    
}
