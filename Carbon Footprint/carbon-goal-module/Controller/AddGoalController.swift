//
//  AddGoalController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class AddGoalController {
    
    // MARK: - Singleton
    
    static let shared = AddGoalController()
    
    private init() {}
    
    // MARK: - Properties
    
    let carbonGoal = CarbonGoal()
    
    // MARK: - Public Methods
    
    /// Captures user input for adding a new goal.
    func captureInputForAddingGoal(type: GoalMenuView.GoalType) {
        let getUserInput = UserInteraction()
        let goalMenuView = GoalMenuView()
        
        if let description = getUserInput.promptMessage(message: "Enter the description:"),
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
    
    /// Handles the fetch goal case.
    func handleFetchGoalCase() {
        let goalMenuView = GoalMenuView()
        let getUserInput = UserInteraction()
        
        // Providing an early exit if there are no goals.
        guard carbonGoal.checkForActiveGoal() else {
            print("No active goals found!")
            goalMenuView.showGoalMenu()
            return
        }
        
        carbonGoal.displayAllGoal()
        
        if let indexInput = getUserInput.promptMessage(message: "Enter goal id:") {
            // Safely convert `indexInput` to an integer value using optional binding.
            // If the conversion fails or the resulting value is nil, display the goal menu
            // and exit the current function or scope.
            guard let input = Int(indexInput) else {
                goalMenuView.showGoalMenu()
                return
            }
            
            guard let result = carbonGoal.fetchGoal(withId: input) else {
                print("No goals found! Try giving the index correctly.")
                carbonGoal.displayAllGoal()
                goalMenuView.showGoalMenu()
                return
            }
            
            carbonGoal.displayExplicitGoal(goal: result)
            
            goalMenuView.showGoalMenu()
        } else {
            print("Invalid input!")
            goalMenuView.showGoalMenu()
        }
    }
    
    /// Handles the update progress case.
    func handleUpdateProgressCase() {
        let goalMenuView = GoalMenuView()
        let getUserInput = UserInteraction()
        
        guard carbonGoal.checkForActiveGoal() == true else {
            print("No active goals found!")
            goalMenuView.showGoalMenu()
            return
        }
        
        if let indexInput = getUserInput.promptMessage(message: "Enter the goal id:"),
           let reductionInput = getUserInput.promptMessage(message: "Enter the reduction emission value:") {
            
            guard let input = Int(indexInput) else {
                goalMenuView.showGoalMenu()
                return
            }
            
            guard let reductionValue = Double(reductionInput) else {
                goalMenuView.showGoalMenu()
                return
            }
            
            carbonGoal.updateGoalProgress(index: input, reductionValue: reductionValue)
            
            carbonGoal.displayAllGoal()
            goalMenuView.showGoalMenu()
        } else {
            print("Invalid input!")
            goalMenuView.showGoalMenu()
        }
    }
    
    /// Handles user input for goal options.
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
            
        case .fetchGoal:
            handleFetchGoalCase()
            
        case .updateGoal:
            handleUpdateProgressCase()
            
        case .goBack:
            menuView.displayMenuOption()
        }
    }
}
