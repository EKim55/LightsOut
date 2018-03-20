//
//  ViewController.swift
//  LightsOut
//
//  Created by CSSE Department on 3/20/18.
//  Copyright © 2018 CSSE Department. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lightButtons: [UIButton]!
    
    @IBOutlet weak var gameMovesLabel: UILabel!
    
    @IBOutlet weak var gameNavigationBar: UINavigationBar!
    
    var lightGame = LinearLightsOutGame(numLights: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameNavigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22)]
        updateLights()
    }

    @IBAction func newGamePressed(_ sender: Any) {
        print("New game!")
        lightGame = LinearLightsOutGame(numLights: 13)
        updateLights()
    }
    
    @IBAction func pressedLight(_ sender: Any) {
        let lightButton = sender as! UIButton
        lightGame.pressedLightAtIndex(lightButton.tag - 1)
        updateLights()
    }
    
    func updateLights() {
        
        let onLight = #imageLiteral(resourceName: "light_on")
        let offLight = #imageLiteral(resourceName: "light_off")
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            gameMovesLabel.text = "Moves taken: \(lightGame.moves)"
        } else {
            gameNavigationBar.topItem?.title = "Moves taken: \(lightGame.moves)"
        }
        for i in 0..<13 {
            let button = lightButtons[i]
            switch(lightGame.lightStates[i]) {
            case true:
                button.setImage(onLight, for: UIControlState.normal)
            case false:
                button.setImage(offLight, for: UIControlState.normal)
            }
        }
        if lightGame.won == true {
            if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
                gameMovesLabel.text = "You win! Moves Taken: \(lightGame.moves)"

            } else {
                gameNavigationBar.topItem?.title = "You win! Moves Taken: \(lightGame.moves)"

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

