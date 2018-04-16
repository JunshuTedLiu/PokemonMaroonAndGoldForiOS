//
//  Animation.swift
//  PokemonMaroonAndGoldiOS
//
//  Created by Junshu Liu on 4/16/18.
//  Copyright © 2018 Junshu Liu. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class Animation: SKScene {
    var contentsCreated = false
    var controller: ViewController!
    
    var player: AVPlayer? = nil
    var item: AVPlayerItem? = nil
    
    override func didMove(to view: SKView) {
        if contentsCreated == false {
            playVideo()
            
            contentsCreated = true
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
        addChild(sample!)
        sample?.play()
        print("Playing animation video.")
        
        finishPlayingCopyrightVideo(videoPlayer: player!)
        
        //        self.view?.presentScene(self.controller.animation, transition: nil)
    }
    
    //Inspired by the loopVideo function in these code from https://stackoverflow.com/questions/27808266/how-do-you-loop-avplayer-in-swift
    func finishPlayingCopyrightVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: item, queue: nil) { notification in
            print("Finished playing animation video.")
            //for test use - looping the video.
            //            videoPlayer.seek(to: kCMTimeZero)
            //            videoPlayer.play()
            
            //jump to next scene - animation
            let transition = SKTransition.fade(withDuration: 0.1)
            if let v = self.view {
                v.presentScene(self.controller.titleS, transition: transition)
            }
        }
    }
}

