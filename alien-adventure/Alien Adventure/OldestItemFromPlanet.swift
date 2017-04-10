//
//  OldestItemFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func oldestItemFromPlanet(inventory: [UDItem], planet: String) -> UDItem? {
        
        return inventory.filter({ item in
            planet == (item.historicalData["PlanetOfOrigin"] as? String ?? "")
        }).max(by: {
            ($0.historicalData["CarbonAge"] as? Int ?? 0) <
            ($1.historicalData["CarbonAge"] as? Int ?? 0)
        })
    
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 2"
