//
//  GoalNavigationController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/06/23.
//

import Foundation

class CarbonOffsetFlowController {
    
    enum GoalMenuCategory: Int {
        case showAvailableCredits = 1
        case offsetCarbon = 2
    }
    
    func handleGoalMenuUserInput(selectedOption option: GoalMenuCategory) {
        switch option {
        case .showAvailableCredits:
            print("Redirecting to display available credits and allowed emission value.")
            
        case .offsetCarbon:
            print("Redirecting to checking for excess carbon credit window.")
            navigatePurchaseConfirmation()
        }
    }
    
    func navigatePurchaseConfirmation() {
        let goalConsoleView = GoalConsoleView()
        let carbonCredit = RevampedCarbonCredit()
        let carbonFootprintData = CarbonFootprintData.shared
        let carbonOffsetCalculator = CarbonOffsetCalculator(carbonFootprintData: carbonFootprintData, revampedCarbonCredit: carbonCredit)
        
        if let selectedOption = goalConsoleView.promptPurchaseConfirmation() {
            
            switch selectedOption {
            case .yes:
                print("Buy credits and update in the data model")
                let creditsRequired = carbonOffsetCalculator.evaluateTotalCreditsRequired()
                print("Credits required = \(creditsRequired)")
                carbonOffsetCalculator.updateRequiredCredits(creditsRequired: creditsRequired)
                carbonOffsetCalculator.updateCarbonCreditLimit()
                print("Updated footprint value after buying = \(RCarbonFootprint.totalFootprint)")
                print("Credits bought = \(carbonCredit.bougthCarbonCredits)")
            case .no:
                print("Do nothing show the Goal menu")
            }
        }
    }
}

