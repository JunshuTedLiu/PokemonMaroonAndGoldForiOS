//
//  LoseGame.swift
//  PokemonMaroonAndGoldiOS
//
//  Created by Junshu Liu on 5/4/18.
//  Copyright © 2018 Junshu Liu. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class LoseGame: SKScene, SKPhysicsContactDelegate {
    var contentsCreated = false
    var controller: ViewController!
    var randomSource = GKLinearCongruentialRandomSource.sharedRandom()
    
    let backgroundTexture = SKTexture(imageNamed: "1200px-Nintendo_Gameboy.jpg")
    let startButtonTexture = SKTexture(imageNamed: "start.png")
    
    override func didMove(to view: SKView) {
        if contentsCreated == false {
            backgroundColor = SKColor.white
            createSceneObjects()
            contentsCreated = true
            physicsWorld.contactDelegate = self
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
    
    func createSceneObjects() {
        physicsWorld.contactDelegate = self
        //        createEdgeBottom()
        //this is the scene1 background.
        let scene = SKTexture(imageNamed: "YouLost.png")
        let sceneNode = SKSpriteNode(texture: scene)
        sceneNode.size = CGSize(width: 375, height: 337.5)
        sceneNode.position = CGPoint(x: 187.5, y: 600)
        sceneNode.zPosition = 10
        guard let v = view else { return }
        //        sceneNode.size = CGSize(width: v.frame.width, height: v.frame.height)
        //        scene1scene.size = CGSize(width: 480, height: 432)
        
        addChild(sceneNode)
        //this is our character, ASH.
        let back = SKTexture(imageNamed: "ASHbackT.png")
        let front = SKTexture(imageNamed: "ASHfront.png")
        let left = SKTexture(imageNamed: "ASHleft.png")
        let right = SKTexture(imageNamed: "ASHright.png")
        let characterTextures = [back, front, left, right]
        
        //build our character.
        //        let character = SKSpriteNode(color: SKColor.green, size: CGSize(width: 64.0, height: 64.0))
        //        character.position = CGPoint(x: frame.midX, y: frame.midY)
        //        character.name = "Character"
        //        character.physicsBody = SKPhysicsBody(rectangleOf: character.size)
        //        character.physicsBody?.isDynamic = false
        //        character.zRotation = 0.75
        //        addChild(character)
        
        let character = SKSpriteNode(texture: back)
        character.position = CGPoint(x: 187.5, y: 600)
        character.size = CGSize(width: 28, height: 32)
        character.zPosition = 11
        character.name = "Character"
        //        character.physicsBody = SKPhysicsBody(rectangleOf: character.size)
        character.physicsBody = SKPhysicsBody(texture: back, size: CGSize(width: 28, height: 32))
        character.physicsBody?.usesPreciseCollisionDetection = true
        character.physicsBody?.contactTestBitMask = 1
        character.physicsBody?.isDynamic = true
        character.physicsBody?.affectedByGravity = false
        
        addChild(character)
        
//        createEdgeBottom()
//        createEdgeDesignNorthRight()
    }
    
    //    @IBAction func Up(_ sender: Any) {
    //        if let node = childNode(withName: "Character") {
    //            node.run(SKAction.moveBy(x: 0, y: 20.0, duration: 0.1))
    //        }
    //    }
    
    //1. make a SKNode
    
    //make our character move.
    
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
                    print("START")
                }
            }
        }
    }
    
    //    override func keyDown (with event: NSEvent) {
    //        print("keyCode is \(event.keyCode)")
    //        //keycode
    //        if let node = childNode(withName: "Character") {
    //            //right
    //            if event.keyCode == 124 {
    //                node.run(SKAction.moveBy(x: 20.0, y: 0, duration: 0.1))
    //            }
    //                //left
    //            else if event.keyCode == 123 {
    //                node.run(SKAction.moveBy(x: -20.0, y: 0, duration: 0.1))
    //            }
    //                //up
    //            else if event.keyCode == 126 {
    //                node.run(SKAction.moveBy(x: 0, y: 20.0, duration: 0.1))
    //            }
    //                //down
    //            else if event.keyCode == 125 {
    //                node.run(SKAction.moveBy(x: 0, y: -20.0, duration: 0.1))
    //            }
    //        }
    //    }
    
//    func createEdgeBottom() {
//        let bottom = SKSpriteNode(color: SKColor.blue, size: CGSize(width: frame.width, height: 30))
//        //        bottom.position = CGPoint(x: frame.midX, y: (view?.frame.midY)!+7)
//        bottom.position = CGPoint(x: (view?.frame.midX)!, y: (view?.frame.midY)!+7)
//        bottom.physicsBody = SKPhysicsBody(rectangleOf: bottom.size)
//        bottom.name = "bottom"
//        
//        bottom.physicsBody?.usesPreciseCollisionDetection = true
//        bottom.physicsBody?.contactTestBitMask = 1
//        bottom.physicsBody?.isDynamic = false
//        
//        addChild(bottom)
//    }
//    
//    func createEdgeDesignNorthRight() {
//        let CDNr = SKSpriteNode(color: SKColor.black, size: CGSize(width: 15, height: 30))
//        CDNr.position = CGPoint(x: (view?.frame.midX)!-25, y: (view?.frame.midY)!+270)
//        CDNr.zPosition = 11
//        CDNr.physicsBody = SKPhysicsBody(rectangleOf: CDNr.size)
//        CDNr.name = "CDNr"
//        
//        CDNr.physicsBody?.usesPreciseCollisionDetection = true
//        CDNr.physicsBody?.contactTestBitMask = 1
//        CDNr.physicsBody?.isDynamic = false
//        
//        addChild(CDNr)
//    }
    
    func didBegin(_ contact: SKPhysicsContact) {
//        print("contact")
//        if contact.bodyA.node?.name == "character" || contact.bodyB.node?.name == "bottom" {
//            //            let goToNextScene = SKTransition.fade(withDuration: 0.5)
//            view?.presentScene(controller.scene1of2)
//        }
//        if contact.bodyA.node?.name == "character" || contact.bodyB.node?.name == "CDNr" {
//            //            let goToNextScene = SKTransition.fade(withDuration: 0.5)
//            view?.presentScene(controller.scene1of2)
//        }
    }
}
