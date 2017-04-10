//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func points(_ item: [String: Any]) -> Int {
        if let lengendary = item["LegendaryItemsDetected"] as? Int,
           let rare       = item["RareItemsDetected"] as? Int,
           let uncommon   = item["UncommonItemsDetected"] as? Int,
           let common     = item["CommonItemsDetected"] as? Int
        {
            return (lengendary * 4) + (rare * 3) +
                   (uncommon   * 2) + common
        }
        
        return 0
    }
    
    func planetData(dataFile: String) -> String {
        
        let dataFileURL = Bundle.main.url(forResource: dataFile, withExtension: "json")!

        let rawItemsJSON = try! Data(contentsOf: dataFileURL)
        
        var itemsArrays: [[String: Any]]!
        do {
            itemsArrays = try! JSONSerialization.jsonObject(with: rawItemsJSON, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
        }

        let mostIntriguingItem = itemsArrays.max(by: {
            points($0) < points($1)
        })!
        
        return mostIntriguingItem["Name"] as? String ?? ""
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"
