//
//  LeastValuableItem.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    func baseValue(_ a: UDItem, _ b: UDItem) -> Bool {
        return a.baseValue < b.baseValue
    }
    
    func leastValuableItem(inventory: [UDItem]) -> UDItem? {
        return inventory.min(by: baseValue)
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"
