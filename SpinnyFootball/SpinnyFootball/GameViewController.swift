//
//  GameViewController.swift
//  SpinnyFootball
//
//  Created by Vlad verba  on 7/7/16.
//  Copyright (c) 2016 TapTapPlay. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds


class GameViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var banner: GADBannerView!

    
    var interGO: GADInterstitial!

    var intersitialRecievedAd = false
    
    var Time = 70000
    var Timer = Foundation.Timer()

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        

        banner.isHidden = true
        
        banner.delegate = self
        banner.adUnitID = "ca-app-pub-7575941856999317/9272542389"
        banner.rootViewController = self
        banner.load(GADRequest())
        
        

        Timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameViewController.Notification), userInfo: nil, repeats: true)

        
        NotificationCenter.default.addObserver(self, selector: #selector(showGameOverAd), name: NSNotification.Name(rawValue: "ShowInterAd"), object: nil)
        
        interGO = GADInterstitial(adUnitID: "ca-app-pub-7575941856999317/9379960387")
        
        let requestGO = GADRequest()
        interGO.load(requestGO)

        }
    

    func showGameOverAd() {
        
        if(interGO.isReady){
            self.interGO.present(fromRootViewController: self)
            interGO = createAd()
        }
        
        
    }
    
    func createAd() -> GADInterstitial {
        
        let interGO = GADInterstitial(adUnitID: "ca-app-pub-7575941856999317/9379960387")
        interGO.load(GADRequest())
        return interGO
        
    }

    
    
    func Notification(){
        
        Time -= 1
        
        if (Time <= 0){
            
            
            
            let Notification = UILocalNotification()
            Notification.alertAction = "Go back to App"
            Notification.alertBody = "Come play Spinny Football and support your favorite teams 🏈"
            Notification.fireDate = Date(timeIntervalSinceNow: 0)
            
            UIApplication.shared.scheduleLocalNotification(Notification)
            
            Timer.invalidate()
        }
        
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView!) {
        banner.isHidden = false
        
    }
    
    func adView(_ bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        banner.isHidden = true
    }
    

    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
