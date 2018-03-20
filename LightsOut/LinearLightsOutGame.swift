//
//  LinearLightsOutGame.swift
//  LightsOut
//
//  Created by CSSE Department on 3/20/18.
//  Copyright © 2018 CSSE Department. All rights reserved.
//

import Foundation

class LinearLightsOutGame: CustomStringConvertible {
    
    let numLights: Int;
    var lightStates = [Bool]();
    var moves: Int;
    var won: Bool;
    
    init(numLights: Int) {
        self.numLights = numLights
        moves = 0
        lightStates = [Bool](repeating: true, count: numLights)
        won = false
        for _ in 0..<10 {
            let randomNumber : Int = Int(arc4random_uniform(UInt32(numLights)))
            pressedLightAtIndex(randomNumber)
            won = false
        }
        moves = 0
        
    }
    
    func pressedLightAtIndex(_ index: Int) -> Bool {
        if won == true{
            return true;
        }
        flipState(index)
        if (index - 1) >= 0 {
            flipState(index - 1)
        }
        if (index + 1) < numLights {
            flipState(index + 1)
        }
        moves += 1
        return checkForGameOver();
    }
    
    func flipState(_ index: Int) {
        if (lightStates[index] == true) {
            lightStates[index] = false
        }
        else if (lightStates[index] == false) {
            lightStates[index] = true
        }
    }
    
    func checkForGameOver() -> Bool{
        for i in 0..<numLights {
            if (lightStates[i] == true) {
                return won
            }
        }
        won = true
        return won
    }
    
    func getGameString() -> String {
        var gameString = ""
        for i in 0..<numLights {
            if (lightStates[i] == true) {
                gameString += "1"
            }
            else if (lightStates[i] == false) {
                gameString += "0"
            }
        }
        return gameString;
    }
    
    var description: String {
        return "Lights: \(getGameString()) Moves: \(moves)"
    }
}
