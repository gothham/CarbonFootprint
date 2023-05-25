//
//  GoalMenuView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class GoalMenuView {
    
    enum `GoalType`: Int {
        case transportation = 1
        case diet = 2
        case electricity = 3
        case household = 4
        case other = 5
        case displayAllGoals = 6
        case goBack = 0
    }
    
    func showGoalMenu() {
        
        print("Goal Menu")
        print("1. Tranportation.")
        print("2. Diet.")
        print("3. Electricity")
        print("4. Household.")
        print("5. Other.")
        print("6. Display all goals.")
        print("0. Go back.")
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = GoalType(rawValue: userChoice) {
            AddGoalController.shared.handleUserInputForGoal(option: option)
        } else {
            showGoalMenu()
        }
    }
    
}


