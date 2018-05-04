//
//  ViewController.swift
//  PokemonMaroonAndGoldiOS
//
//  Created by Junshu Liu on 4/9/18.
//  Copyright © 2018 Junshu Liu. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet var spriteView: SKView!
    var copyright: Copyright!
    var animation: Animation!
    var titleS: Title!
    var scene1: Scene1!
    var scene1of2: Scene1of2!
    var scene1of3: Scene1of3!
    var scene1of4: Scene1of4!
    var scene1of5: Scene1of5!
    var scene1of6: Scene1of6!
    var scene2of1: Scene2of1!
    var scene2of2: Scene2of2!
    var scene2of3: Scene2of3!
    var scene2of4: Scene2of4!
    var scene2of5: Scene2of5!
    var scene2of6: Scene2of6!
    var loseGame: LoseGame!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) //add parameter for ios
        let spriteView = view as! SKView
        
        copyright = Copyright(size: CGSize(width: view.frame.width, height: view.frame.height))
        animation = Animation(size: CGSize(width: view.frame.width, height: view.frame.height))
        titleS = Title(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1 = Scene1(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1of2 = Scene1of2(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1of3 = Scene1of3(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1of4 = Scene1of4(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of1 = Scene2of1(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of2 = Scene2of2(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of3 = Scene2of3(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of4 = Scene2of4(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of5 = Scene2of5(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene2of6 = Scene2of6(size: CGSize(width: view.frame.width, height: view.frame.height))
        loseGame = LoseGame(size: CGSize(width: view.frame.width, height: view.frame.height))
        
        copyright.controller = self
        animation.controller = self
        titleS.controller = self
        scene1.controller = self
        scene1of2.controller = self
        scene1of3.controller = self
        scene1of4.controller = self
        scene2of1.controller = self
        scene2of2.controller = self
        scene2of3.controller = self
        scene2of4.controller = self
        scene2of5.controller = self
        scene2of6.controller = self
        loseGame.controller = self
        
        spriteView.presentScene(copyright)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
