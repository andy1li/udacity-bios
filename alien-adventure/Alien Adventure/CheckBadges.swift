//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        let types = badges.map { badge in
            badge.requestType
        }
        
        return requestTypes.map({ requestType in
            types.contains(requestType)
        }).reduce(true, {
            $0 && $1
        })
    }
    
}
