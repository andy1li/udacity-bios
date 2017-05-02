//
//  Settings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/18/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - Settings

struct Settings {
                
    // MARK: Common
    
    struct Common {        
        static let GameDataURL = Bundle.main.url(forResource: "GameData", withExtension: "plist")!
        static let Font = "Superclarendon-Italic"
        static let FontColor = UIColor.white
        static var Level = 2
        static var ShowBadges = false
        static let RequestsToSkip = 0
    }
    
    // MARK: Dialogue (Set by UDDataLoader)
    
    struct Dialogue {
        static var StartingDialogue = ""
        static var RequestingDialogue = ""
        static var TransitioningDialogue = ""
        static var WinningDialogue = ""
        static var LosingDialogue = ""
    }
    
    // MARK: Names
    
    struct Names {
        static let Hero = "Hero"
        static let Background = "Background"
        static let Treasure = "Treasure"
    }
}
