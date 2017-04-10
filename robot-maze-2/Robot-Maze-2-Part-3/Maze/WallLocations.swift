//
//  WallLocations.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 12/1/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func isFacingWall(_ robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
        
        let cell = mazeController.currentCell(robot)
        var isWall: Bool = false
        
        print("cell above robot?: \(cell.top)")
        print("cell below robot?: \(cell.bottom)")
        print("cell to left of robot?: \(cell.left)")
        print("cell to right of robot?: \(cell.right)")
        
        // You may want to paste your Part 1 implementation of isFacingWall() here
        switch direction {
        case .up:
            isWall = cell.top
        case .right:
            isWall = cell.right
        case .down:
            isWall = cell.bottom
        case .left:
            isWall = cell.left
        }
        
        return isWall
    }
    
    func checkWalls(_ robot:ComplexRobotObject) -> (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int) {
        
        let cell = mazeController.currentCell(robot)
        
        // You may want to paste your Part 2 implementation of checkWalls() here
        let isWallUp    = cell.top
        let isWallRight = cell.right
        let isWallDown  = cell.bottom
        let isWallLeft  = cell.left
        let areWalls    = [isWallUp, isWallRight, isWallDown, isWallLeft]
        
        let numberOfWalls = areWalls.map({ $0 ? 1 : 0 }).reduce(0, +)
        
        return (isWallUp, isWallRight, isWallDown, isWallLeft, numberOfWalls)
    }
}
