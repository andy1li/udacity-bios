//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine : _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        human.addShipToGrid(Ship(length: 5, location: GridLocation(x: 0, y: 0), isVertical: true))
        human.addShipToGrid(Ship(length: 4, location: GridLocation(x: 1, y: 0), isVertical: true))
        human.addShipToGrid(Ship(length: 3, location: GridLocation(x: 2, y: 0), isVertical: true))
        human.addShipToGrid(Ship(length: 3, location: GridLocation(x: 3, y: 0), isVertical: true))
        human.addShipToGrid(Ship(length: 2, location: GridLocation(x: 4, y: 0), isVertical: true))
        
        
        human.addMineToGrid(Mine(location: GridLocation(x: 5, y: 0), explosionText: "Ha ha!"))
        human.addMineToGrid(Mine(location: GridLocation(x: 6, y: 0), explosionText: "Burn!"))
        
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        let enemyShipsSunk      = 5 - gameStats.enemyShipsRemaining
        let sinkBonus           = gameStats.sinkBonus
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let shipBonus           = gameStats.shipBonus
        let numberOfGuesses     = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let guessPenalty        = gameStats.guessPenalty
        
        
        let finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        return finalScore
    }
}
