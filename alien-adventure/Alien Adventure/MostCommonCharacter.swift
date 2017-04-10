//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func charactersCount(_ inventory: [UDItem]) -> [Character: Int] {

        var count = [Character: Int]()
        
        inventory.flatMap({ item in
            item.name.lowercased().characters
        }).forEach({ character in
            if count[character] == nil {
                count[character] = 1
            } else {
                count[character]! += 1
            }
        })
        
        return count
    }
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        return (charactersCount(inventory)
                .max(by: {$0.1 < $1.1})?
                .0) ?? nil
    }
}
