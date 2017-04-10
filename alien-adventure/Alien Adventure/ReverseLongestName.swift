//
//  ReverseLongestName.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func length(_ a: String, _ b: String) -> Bool {
        return a.characters.count < b.characters.count
    }
    
    func reverse(_ s: String) -> String {
        return String(s.characters.reversed())
    }
    
    func reverseLongestName(inventory: [UDItem]) -> String {
        let longestName = inventory.map({ $0.name })
                                   .max(by: length)
        
        return reverse(longestName ?? "")
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 1"
