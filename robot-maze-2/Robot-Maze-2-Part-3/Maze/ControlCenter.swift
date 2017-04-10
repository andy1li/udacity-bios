//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 2 implementation of moveComplexRobot() here
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        let myWallInfo = checkWalls(myRobot)
        
//        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
//        let isTwoWayPath       = (myWallInfo.numberOfWalls == 2)
//        let isDeadEnd          = (myWallInfo.numberOfWalls == 3)
        
        switch myWallInfo.numberOfWalls {
        case 1: // isThreeWayJunction
            robotIsBlocked ? randomlyRotateRightOrLeft(myRobot)
                           : continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
        case 2: // isTwoWayPath
            robotIsBlocked ? turnTowardClearPath(myRobot, wallInfo: myWallInfo)
                           : myRobot.move()
        case 3: // isDeadEnd
            robotIsBlocked ? myRobot.rotateRight()
                           : myRobot.move()
        default:
            break
        }
        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
