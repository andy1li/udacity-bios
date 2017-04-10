//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func allEmpty(_ s1: String, _ s2: String, _ shuffle: String) -> Bool {
        return (shuffle == "") && (shuffle == s1) && (s1 == s2)
    }
    
    func sameChars(_ s1: String, _ s2: String, _ shuffle: String) -> Bool {
        return shuffle.characters.sorted() ==
               (s1.characters + s2.characters).sorted()
    }
    
    func getIndices(of: String, asIn: [Character: Int]) -> [Int] {
        return of.characters.map({ asIn[$0]! })
    }
    
    func isAsc(_ s: [Int]) -> Bool {
        return s == s.sorted()
    }
    
    func validate(_ s1: String, _ s2: String, _ shuffle: String) -> Bool {
        
        var shuffleIndices = [Character: Int]()
        shuffle.characters.enumerated().forEach({ (index, character) in
            shuffleIndices[character] = index
        })
        
        let s1Indices = getIndices(of: s1, asIn: shuffleIndices)
        let s2Indices = getIndices(of: s2, asIn: shuffleIndices)
        
        return isAsc(s1Indices) && isAsc(s2Indices)
    }
    
    func shuffleStrings(s1: String, s2: String, shuffle: String) -> Bool {
        
        if allEmpty(s1, s2, shuffle) {
            return true
            
        } else if !sameChars(s1, s2, shuffle) {
            return false
            
        } else {
            return validate(s1, s2, shuffle)
            
        }
    }
}
