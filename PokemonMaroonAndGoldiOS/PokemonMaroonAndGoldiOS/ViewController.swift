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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) //add parameter for ios
        let spriteView = view as! SKView
        
        copyright = Copyright(size: CGSize(width: view.frame.width, height: view.frame.height))
        animation = Animation(size: CGSize(width: view.frame.width, height: view.frame.height))
        titleS = Title(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1 = Scene1(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1of2 = Scene1of2(size: CGSize(width: view.frame.width, height: view.frame.height))
        scene1of3 = Scene1of3(size: CGSize(width: view.frame.width, height: view.frame.height))
        
        copyright.controller = self
        animation.controller = self
        titleS.controller = self
        scene1.controller = self
        scene1of2.controller = self
        scene1of3.controller = self
        
        spriteView.presentScene(scene1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
