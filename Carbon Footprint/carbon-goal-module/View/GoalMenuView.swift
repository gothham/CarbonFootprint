//
//  GoalMenuView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class GoalMenuView {
    
    enum GoalType: Int, CaseIterable {
        case transportation = 1
        case diet
        case electricity
        case household
        case other
        case displayAllGoals
        case fetchGoal
        case updateGoal
        case goBack
        
        static var menuOptions: String {
            return allCases.map { "\($0.rawValue). \($0.title)" }.joined(separator: "\n")
        }
        
        var title: String {
            switch self {
            case .transportation: return "Tranportation"
            case .diet: return "Diet"
            case .electricity: return "Electricity"
            case .household: return "Household"
            case .other: return "Other"
            case .displayAllGoals: return "Display all goals"
            case .fetchGoal: return "Fetch goal"
            case .updateGoal: return "Update progress"
            case .goBack: return "Go back"
            }
        }
    }
    
    func showGoalMenu() {
        print("Goal Menu")
        print(GoalType.menuOptions)
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = GoalType(rawValue: userChoice) {
            AddGoalController.shared.handleUserInputForGoal(option: option)
        } else {
            showGoalMenu()
        }
    }
}



