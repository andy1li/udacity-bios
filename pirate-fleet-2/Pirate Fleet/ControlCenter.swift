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
    let isWooden: Bool
    

// TODO: Add the computed property, cells.
    var cells: [GridLocation] {
        // Hint: These two constants will come in handy
        let start = self.location
        let end: GridLocation = ShipEndLocation(self)
        
        // Hint: The cells getter should return an array of GridLocations.
        var occupiedCells = [GridLocation]()
        
        if start.x < end.x {
            for x in start.x...end.x {
                occupiedCells.append( GridLocation(x: x, y: start.y))
            }
        } else if start.y < end.y {
            for y in start.y...end.y {
                occupiedCells.append( GridLocation(x: start.x, y: y))
            }
        }
        
        return occupiedCells
    }
    
    var hitTracker: HitTracker
    
// TODO: Add a getter for sunk. Calculate the value returned using hitTracker.cellsHit.
    var sunk: Bool {
        let cellsHit = Array(hitTracker.cellsHit.values)
        return !cellsHit.contains(false)
    }

// TODO: Add custom initializers
    init(length: Int, location: GridLocation, isVertical: Bool) {
        self.length = length
        self.location = location
        self.isVertical = isVertical
        self.isWooden = false
        self.hitTracker = HitTracker()
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool, isWooden: Bool) {
        self.length = length
        self.location = location
        self.isVertical = isVertical
        self.isWooden = isWooden
        self.hitTracker = HitTracker()
    }
}

// TODO: Change Cell protocol to PenaltyCell and add the desired properties
protocol PenaltyCell {
    var location: GridLocation {get}
    var guaranteesHit: Bool {get}
    var penaltyText: String {get}
}

// TODO: Adopt and implement the PenaltyCell protocol
struct Mine: PenaltyCell {
    let location: GridLocation
    let guaranteesHit: Bool
    let penaltyText: String
    
    init(location: GridLocation, penaltyText: String) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = false
    }
    
    init(location: GridLocation, penaltyText: String, guaranteesHit: Bool) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = guaranteesHit
    }

}

// TODO: Adopt and implement the PenaltyCell protocol
struct SeaMonster: PenaltyCell {
    let location: GridLocation
    let guaranteesHit = true
    let penaltyText = "Whoa Nessie!"
}

class ControlCenter {
    
    func placeItemsOnGrid(_ human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true, isWooden: true)
        human.addShipToGrid(smallShip)
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false, isWooden: true)
        human.addShipToGrid(mediumShip2)
        
        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true)
        human.addShipToGrid(largeShip)
        
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true, isWooden: true)
        human.addShipToGrid(xLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 0), penaltyText: "Boom!")
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 3, y: 3),
                         penaltyText: "Super Bomb!",
                         guaranteesHit: true)
        human.addMineToGrid(mine2)
        
        let seamonster1 = SeaMonster(location: GridLocation(x: 5, y: 6))
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(location: GridLocation(x: 2, y: 2))
        human.addSeamonsterToGrid(seamonster2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
        
        return finalScore
    }
}
