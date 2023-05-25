//
//  AddGoalController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class AddGoalController {
    
    static let shared = AddGoalController()
    
    let carbonGoal = CarbonGoal()
    
    func captureInputForAddingGoal(type: GoalMenuView.GoalType) {
        
        let getUserInput = UserInteraction()
        let goalMenuView = GoalMenuView()
        
        if let description = getUserInput.promptMessage(message: "Enter the decription:"),
           let targetReductionValueInput = getUserInput.promptMessage(message: "Enter the target emission value to set target:") {
            
            guard let targetReductionValue = Double(targetReductionValueInput) else { return }
            
            carbonGoal.addGoal(description: description, targetEmissionReduction: targetReductionValue, type: type)
            carbonGoal.displayAllGoal()
            goalMenuView.showGoalMenu()
            
            
        } else {
            print("Invalid input!")
            goalMenuView.showGoalMenu()
        }
        
    }
    
    func handleUserInputForGoal(option: GoalMenuView.GoalType) {
        
        let menuView = MenuLogicView()
        let goalMenu = GoalMenuView()
        
        switch option {
            
        case .transportation:
            captureInputForAddingGoal(type: .transportation)
        case .diet:
            captureInputForAddingGoal(type: .diet)
        case .electricity:
            captureInputForAddingGoal(type: .electricity)
        case .household:
            captureInputForAddingGoal(type: .household)
        case .other:
            captureInputForAddingGoal(type: .other)
        case .displayAllGoals:
            carbonGoal.displayAllGoal()
            goalMenu.showGoalMenu()
        case .goBack:
            menuView.displayMenuOption()
        }
        
    }
    
}
