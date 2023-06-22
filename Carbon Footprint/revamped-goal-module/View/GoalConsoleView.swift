//
//  GoalConsoleComponentView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/06/23.
//

import Foundation

class GoalConsoleView {
    
    let goalNavigationController = CarbonOffsetFlowController()
    
    enum PurchaseConfirmationOption: Int {
        case yes = 1
        case no = 2
    }
    
    func promptPurchaseConfirmation() -> PurchaseConfirmationOption? {
        
        print("Do you want to confirm your purchase?")
        print("1. Yes")
        print("2. No")
        
        if let input = readLine(), let selectedOption = Int(input) {
            return PurchaseConfirmationOption(rawValue: selectedOption)
        }
        
        return PurchaseConfirmationOption.no
        
    }
    
    func captureUserInputForMenu() {
        
        print("")
        print("Select a option from below")
        print("1. Show available credit.")
        print("2. Check for excess emission")
        
        if let userInput = readLine(), let selectedNumber = Int(userInput), let selectedOption = CarbonOffsetFlowController.GoalMenuCategory(rawValue: selectedNumber) {
            goalNavigationController.handleGoalMenuUserInput(selectedOption: selectedOption)
        }
        
    }
    
    /*func showSuccessMessage() {
        let carbonCredit = RevampedCarbonCredit()
        print("Successful purchase.")
        print("You currently have \(carbonCredit.bougthCarbonCredits) available with you!")
    }*/
}

