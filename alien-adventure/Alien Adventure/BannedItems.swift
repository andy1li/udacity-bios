//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItemID(item: [String: Any]) -> Int? {
    
        if let name = item["Name"] as? String,
               name.lowercased().contains("laser"),
           let data = item["HistoricalData"] as? [String: Any],
           let age  = data["CarbonAge"] as? Int,
               age  < 30
        {
            return item["ItemID"] as! Int?
        } else {
            return nil
        }
    }
    
    func bannedItems(dataFile: String) -> [Int] {
    
        let dataFileURL = Bundle.main.url(forResource: dataFile, withExtension: "plist")!
        
        let itemsArray = NSArray(contentsOf: dataFileURL) as! [[String: Any]]
        
        return itemsArray.flatMap( bannedItemID )
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"
