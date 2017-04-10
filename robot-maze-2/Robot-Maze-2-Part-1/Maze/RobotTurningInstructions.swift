//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        print("randomlyRotateRightOrLeft: \(randomNumber)")
        // Step 1.2
        // TODO: Write an if statement that randomly calls either robot.rotateRight() or robot.rotateLeft() (based on the value of the randomNumber constant)
        if randomNumber == 0 {
            robot.rotateRight()
        } else if randomNumber == 1 {
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        print("continueStraightOrRotate: \(randomNumber)")
        // Step 1.3
        // TODO: Write an if statement that randomly calls either robot.move() or randomlyRotateRightOrLeft(robot: ComplexRobotObject)
        if randomNumber == 0 {
            robot.move()
        } else if randomNumber == 1 {
            randomlyRotateRightOrLeft(robot)
        }
    }
}
