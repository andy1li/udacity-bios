//
//  XORCipherKeySearch.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func xorCipherKeySearch(encryptedString: [UInt8]) -> UInt8 {
        
        // NOTE: This code doesn't exactly mimic what is in the Lesson. We've
        // added some print statements so that there are no warnings for 
        // unused variables 😀.
        
        for possibleKey in UInt8.min..<UInt8.max {
            
            let decryptedBytes = encryptedString.map { byte in
                byte ^ possibleKey
            }
            
            let decryptedString = String(bytes: decryptedBytes,
                                         encoding: String.Encoding.utf8) ?? ""
            
            if decryptedString == "udacity" {
                return possibleKey 
            }
        }
        
        return 0
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 3"
