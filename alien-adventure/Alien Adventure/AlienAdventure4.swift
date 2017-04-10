//
//  AlienAdventure4.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/5/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - RequestTester (Alien Adventure 4 Tests)

extension UDRequestTester {
    
    // MARK: PolicingItems
    
    func testPolicingItems() -> Bool {
        
        func policingFilter(_ item: UDItem) throws {
            if item.name.lowercased().contains("laser") {
                throw UDPolicingError.nameContainsLaser
            }
            
            if let planetOfOrigin = item.historicalData["PlanetOfOrigin"] as? String, planetOfOrigin == "Cunia" {
                throw UDPolicingError.itemFromCunia
            }
            
            if item.baseValue < 10 {
                throw UDPolicingError.valueLessThan10
            }
        }
        
        // check 1
        let errorsDetected1 = delegate.handlePolicingItems(delegate.inventory, policingFilter: policingFilter)
        if errorsDetected1[.valueLessThan10] != 4 {
            print("PolicingItems FAILED: An incorrect number of .ValueLessThan10 errors were detected.")
            return false
        }
        if errorsDetected1[.nameContainsLaser] != 1 {
            print("PolicingItems FAILED: An incorrect number of .NameContainsLaser errors were detected.")
            return false
        }
        if errorsDetected1[.itemFromCunia] != 3 {
            print("PolicingItems FAILED: An incorrect number of .ItemFromCunia errors were detected.")
            return false
        }
        
        // check 2
        let errorsDetected2 = delegate.handlePolicingItems(allItems(), policingFilter: policingFilter)
        if errorsDetected2[.valueLessThan10] != 3 {
            print("PolicingItems FAILED: An incorrect number of .ValueLessThan10 errors were detected.")
            return false
        }
        if errorsDetected2[.nameContainsLaser] != 2 {
            print("PolicingItems FAILED: An incorrect number of .NameContainsLaser errors were detected.")
            return false
        }
        if errorsDetected2[.itemFromCunia] != 4 {
            print("PolicingItems FAILED: An incorrect number of .ItemFromCunia errors were detected.")
            return false
        }
        
        // check 3
        if delegate.handlePolicingItems([UDItem](), policingFilter: policingFilter) != [
            .valueLessThan10: 0,
            .nameContainsLaser: 0,
            .itemFromCunia: 0
            ] {
                print("PolicingItems FAILED: If the inventory is empty, then 0 errors should have been detected for each type of UDPolicingError.")
                return false
        }
        
        return true
    }
    
    // MARK: RemoveTheLasers
    
    func testFindTheLasers() -> Bool {
        
        let hasLaser = delegate.handleFindTheLasers()
        
        let inventoryWithLasers = delegate.inventory.filter(hasLaser)
        
        if inventoryWithLasers.count > 0 {
            for item in inventoryWithLasers {
                if !item.name.lowercased().contains("laser") {
                    print("FindTheLasers FAILED: The method you returned responded true for an item with the name \(item.name) which does not contain the word laser.")
                    return false
                }
            }
        } else {
            print("FindTheLasers FAILED: The method you returned did not correctly find an item containing the word laser.")
            return false
        }
        
        return true
    }
    
    // MARK: RedefinePolicingItems
    
    func testRedefinePolicingItems() -> Bool {
        
        let redefinedPoliceFilter = delegate.handleRedefinePolicingItems()
        
        // check 1
        let errorsDetected1 = delegate.handlePolicingItems(delegate.inventory, policingFilter: redefinedPoliceFilter)
        if errorsDetected1[.nameContainsLaser] != 1 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .NameContainsLaser errors in all cases.")
            return false
        }
        if errorsDetected1[.itemFromCunia] != 3 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .ItemFromCunia errors in all cases.")
            return false
        }
        if errorsDetected1[.valueLessThan10] != 4 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .ValueLessThan10 errors in all cases.")
            return false
        }
        
        // check 2
        let errorsDetected2 = delegate.handlePolicingItems(allItems(), policingFilter: redefinedPoliceFilter)
        if errorsDetected2[.nameContainsLaser] != 2 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .NameContainsLaser errors in all cases.")
            return false
        }
        if errorsDetected2[.itemFromCunia] != 4 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .ItemFromCunia errors in all cases.")
            return false
        }
        if errorsDetected2[.valueLessThan10] != 3 {
            print("RedefinePolicingItems FAILED: Your method does not detect the correct amount of .ValueLessThan10 errors in all cases.")
            return false
        }
        
        // check 3
        if delegate.handlePolicingItems([UDItem](), policingFilter: redefinedPoliceFilter) != [
            .valueLessThan10: 0,
            .nameContainsLaser: 0,
            .itemFromCunia: 0
            ] {
                print("RedefinePolicingItems FAILED: If the inventory is empty, then 0 errors should have been detected for each type of UDPolicingError.")
                return false
        }
        
        return true
    }
    
    // MARK: BoostItemValue
    
    func testBoostItemValue() -> Bool {
        
        var originalValues = [Int]()
        
        for item in delegate.inventory {
            originalValues.append(item.baseValue)
        }
        
        // check 1
        let modifiedInventory = delegate.handleBoostItemValue(delegate.inventory)
        
        // modified inventory should have same number of items as inventory
        if modifiedInventory.count != delegate.inventory.count {
            return false
        }
        
        for (index, item) in modifiedInventory.enumerated() {
            if item.baseValue != originalValues[index] + 100 {
                print("BoostItemValue FAILED: An item's base value has not been boosted by 100.")
                return false
            }
        }
        
        return true
    }
    
    // MARK: SortLeastToGreatest
    
    func testSortLeastToGreatest() -> Bool {
        
        // check 1
        let sortedInventory = delegate.handleSortLeastToGreatest(delegate.inventory)
        
        // sorted inventory must have all items from the inventory
        if sortedInventory.count != delegate.inventory.count {
            return false
        }
        
        for index in 0 ..< sortedInventory.count - 1 {
            if !(sortedInventory[index] <= sortedInventory[index+1]) {
                print("SortLeastToGreatest FAILED: In a sorted inventory, \(sortedInventory[index]) appears before \(sortedInventory[index+1]). That is incorrect.")
                return false
            }
        }
        
        // check 2
        let sortedAllItems = delegate.handleSortLeastToGreatest(allItems())
        
        // all sorted items must have all items
        if sortedAllItems.count != allItems().count {
            return false
        }
        
        for index in 0 ..< sortedAllItems.count - 1 {
            if !(sortedAllItems[index] <= sortedAllItems[index+1]) {
                print("SortLeastToGreatest FAILED: In a sorted inventory, \(sortedAllItems[index]) appears before \(sortedAllItems[index+1]). That is incorrect.")
                return false
            }
        }
        
        return true
    }
    
    // MARK: GetCommonItems
    
    func testGetCommonItems() -> Bool {
        
        // check 1
        let commonItems = delegate.handleGetCommonItems(delegate.inventory)
        
        if commonItems.count != 5 {
            return false
        }
        
        for item in commonItems {
            if item.rarity != .common {
                print("GetCommonItems FAILED: When reducing an inventory to only the .Common items, \(item) was still included.")
                return false
            }
        }
        
        return true
    }
    
    // MARK: TotalBaseValue
    
    func testTotalBaseValue() -> Bool {
        
        // check 1
        if delegate.handleTotalBaseValue(delegate.inventory) != 25 {
            print("TotalBaseValue FAILED: The combined base value of all your items is incorrect.")
            return false
        }
        
        // check 2
        if delegate.handleTotalBaseValue(allItems()) != 381 {
            print("TotalBaseValue FAILED: The combined base value of all your items is incorrect.")
            return false
        }
        
        return true
    }
    
    // MARK: RemoveDuplicates
    
    func testRemoveDuplicates() -> Bool {
        
        // check 1
        var emptySetOfItems = Set<UDItem>()
        let noDuplicateItems = delegate.handleRemoveDuplicates(delegate.inventory)
        
        // duplicate items has at least one item...
        if noDuplicateItems.count != 5 {
            return false
        }
        
        for item in noDuplicateItems {
            if emptySetOfItems.contains(item) {
                print("RemoveDuplicates FAILED: Not all duplicates were removed from the inventory.")
                return false
            } else {
                emptySetOfItems.insert(item)
            }
        }
        
        return true
    }
    
}

// MARK: - RequestTester (Alien Adventure 4 Process Requests)

extension UDRequestTester {
    
    // MARK: PolicingItems
    
    func processPolicingItems() -> String {
        
        var processingString = "Hero: \""
        
        func policingFilter(_ item: UDItem) throws {
            if item.name.lowercased().contains("laser") {
                throw UDPolicingError.nameContainsLaser
            }
            
            if let planetOfOrigin = item.historicalData["PlanetOfOrigin"] as? String, planetOfOrigin == "Cunia" {
                throw UDPolicingError.itemFromCunia
            }
            
            if item.baseValue < 10 {
                throw UDPolicingError.valueLessThan10
            }
        }
        
        let errorsReported = delegate.handlePolicingItems(delegate.inventory, policingFilter: policingFilter)
        
        if errorsReported[UDPolicingError.valueLessThan10] != nil && errorsReported[UDPolicingError.nameContainsLaser] != nil && errorsReported[UDPolicingError.itemFromCunia] != nil {
            processingString += "I found \(errorsReported[UDPolicingError.valueLessThan10]! + errorsReported[UDPolicingError.itemFromCunia]! + errorsReported[UDPolicingError.nameContainsLaser]!) total errors.\""
        } else {
            processingString += "I found some errors.\""
        }
        
        return processingString
    }
    
    // MARK: RemoveTheLasers
    
    func processFindTheLasers() -> String {
        return "Hero: \"How about this method?\""
    }
    
    // MARK: RedefinePolicingItems
    
    func processRedefinePolicingItems() -> String {
        return "Hero: \"Try this method.\""
    }
    
    // MARK: BoostItemValue
    
    func processBoostItemValue() -> String {
        return "Hero: \"This should do the trick.\""
    }
    
    // MARK: SortLeastToGreatest
    
    func processSortLeastToGreatest() -> String {
        return "Hero: \"How about this?\""
    }
    
    // MARK: GetCommonItems
    
    func processGetCommonItems() -> String {
        return "Hero: \"I think you'd want to reduce it this way.\""
    }
    
    // MARK: TotalBaseValue
    
    func processTotalBaseValue() -> String {
        return "Hero: \"The combined base value of my items is \(delegate.handleTotalBaseValue(delegate.inventory)).\""
    }
    
    // MARK: RemoveDuplicates
    
    func processRemoveDuplicates() -> String {
        return "Hero: \"Here, this is my inventory without any duplicate items.\""
    }
}
