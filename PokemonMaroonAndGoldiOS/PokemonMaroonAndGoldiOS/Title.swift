//
//  Title.swift
//  PokemonMaroonAndGoldiOS
//
//  Created by Junshu Liu on 4/16/18.
//  Copyright © 2018 Junshu Liu. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class Title: SKScene {
    var contentsCreated = false
    var controller: ViewController!
    
    var player: AVPlayer? = nil
    var item: AVPlayerItem? = nil
    
    let backgroundTexture = SKTexture(imageNamed: "1200px-Nintendo_Gameboy.jpg")
    let startButtonTexture = SKTexture(imageNamed: "start.png")
    
    override func didMove(to view: SKView) {
        if contentsCreated == false {
            playVideo()
            
            contentsCreated = true
        }
        
        //background
        let backgroundPicture = SKSpriteNode(texture: backgroundTexture)
        /*sample?.size = CGSize(width: 375, height: 337.5)
         sample?.position = CGPoint(x: 187.5, y: 600)*/
        backgroundPicture.position = CGPoint(x: view.frame.midX, y: view.frame.midY+7)
        backgroundPicture.size = CGSize(width: 390, height: 640.25)
        addChild(backgroundPicture)
        
        //buttons
        let startButton = SKSpriteNode(texture: startButtonTexture)
        startButton.name = "start"
        startButton.position = CGPoint(x: 104, y: 304.5)
        startButton.size = CGSize(width: 56, height: 42)
        addChild(startButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        guard let character = childNode(withName: "Character") else { return }
        if let touch = touches.first {
            let location = touch.location(in: self)
            let list = nodes(at: location)
            for node in list {
                // my code
                
                if node.name == "start" {
                    if let v = self.view {
                        v.presentScene(self.controller.scene1)
                    }
                    //                    let doors = SKTransition.doorsOpenVertical(withDuration: 0.5)
                    //                    self.view?.presentScene(controller.flappy, transition: doors)
                    //                    return
                    print("UP")
                }
            }
        }
    }
    
    func playVideo() {
        //        let sample = SKVideoNode(fileNamed: "Pokemon Opening Copyright.mov")
        let sample: SKVideoNode? = {
            guard let urlString = Bundle.main.path(forResource: "Pokemon Opening Animation", ofType: "mov") else {
                return nil
            }
            let url = URL(fileURLWithPath: urlString)
            //            print(url)
            item = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: item)
            
            return SKVideoNode(avPlayer: player!)
        }()
        
        sample?.size = CGSize(width: 375, height: 337.5)
        sample?.position = CGPoint(x: 187.5, y: 600)
        sample?.zPosition = 10
        addChild(sample!)
        sample?.play()
        print("Playing title video.")
        
        finishPlayingCopyrightVideo(videoPlayer: player!)
        
        //        self.view?.presentScene(self.controller.animation, transition: nil)
    }
    
    //Inspired by the loopVideo function in these code from https://stackoverflow.com/questions/27808266/how-do-you-loop-avplayer-in-swift
    func finishPlayingCopyrightVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: item, queue: nil) { notification in
            print("Finished playing title video.")
            //for test use - looping the video.
            //            videoPlayer.seek(to: kCMTimeZero)
            //            videoPlayer.play()
            
            //jump to next scene - animation
            let transition = SKTransition.fade(withDuration: 0.1)
            if let v = self.view {
                v.presentScene(self.controller.scene1, transition: transition)
            }
        }
    }
}
