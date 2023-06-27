//
//  GoalNavigationController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/06/23.
//

import Foundation

class CarbonOffsetFlowController {
    
    // MARK: - Singleton class
    static let shared = CarbonOffsetFlowController()
    
    private init() {}
    
    // MARK: - Properties
    let carbonCredit = RevampedCarbonCredit()
    let carbonFootprintData = CarbonFootprintData.shared
    
    // MARK: - Public Methods

    /// Navigates the offset option based on user input.
    func navigateOffsetOption() {
        let consoleView = CarbonOffsetConsoleView()
        
        if let selectedOption = consoleView.promptSelectOffsetOption() {
            switch selectedOption {
            case .sell:
                getUserInputForCreditSaleAmount()
                /// Taking the user back to Offset menu
                navigateOffsetMenuOption()
                
            case .buy:
                fetchRequiredCreditInputs()
                /// Taking the user back to Offset menu
                navigateOffsetMenuOption()
                
            case .checkLimit:
                navigatePurchaseConfirmation()
                /// Taking the user back to Offset menu
                navigateOffsetMenuOption()
            }
        }
    }

    /// Navigates the offset menu option based on user input.
    func navigateOffsetMenuOption() {
        let consoleView = CarbonOffsetConsoleView()
        
        if let selectedOption = consoleView.promptUserForMenuSelection() {
            switch selectedOption {
            case .showStats:
                print("showAvailableCredits selected")
                
            case .offsetCarbon:
                print("offsetCarbonSelected")
                navigateOffsetOption()
                
            case .goBack:
                MenuLogicView.shared.displayMenuOption()
            }
        }
    }

    /// Navigates the purchase confirmation based on user input.
    func navigatePurchaseConfirmation() {
        let consoleView = CarbonOffsetConsoleView()
        let carbonOffsetCalculator = CarbonOffsetCalculator(carbonFootprintData: carbonFootprintData, revampedCarbonCredit: carbonCredit)
        
        if let selectedOption = consoleView.promptPurchaseConfirmation() {
            switch selectedOption {
            case .yes:
                carbonOffsetCalculator.comfirmCarbonCreditPurchase()
            case .no:
                navigateOffsetOption()
            }
        }
    }
    
    // MARK: - Methods to get user input.
    
    /// Gets the usre input for buying the required credits.
    func fetchRequiredCreditInputs() {
        let view = UserInteraction()
        let carbonOffsetCalculator = CarbonOffsetCalculator(carbonFootprintData: carbonFootprintData, revampedCarbonCredit: carbonCredit)
        
        if let userInput = view.promptMessage(message: "Enter the amount of credits required:"),
           let requiredCredits = Double(userInput) {
            carbonOffsetCalculator.buyCarbonCredit(requiredCredits: requiredCredits)
            print("carbonCredit.boughtCarbonCredits = \(carbonCredit.boughtCarbonCredits)")
            print("carbonFootprintData.carbonCreditLimit(after)= \(carbonFootprintData.carbonCreditLimit)")
        } else {
            print("Optional binding failed!")
            print("Try giving a Int or Double value.")
            print("Trying again...")
            fetchRequiredCreditInputs()
        }
    }
    
    /// Gets the user input for selling the credits.
    func getUserInputForCreditSaleAmount() {
        let view = UserInteraction()
        let carbonOffsetCalculator = CarbonOffsetCalculator(carbonFootprintData: carbonFootprintData, revampedCarbonCredit: carbonCredit)
        
        if let userInput = view.promptMessage(message: "Enter the amount of credits to be sold:"),
           let amountOfCredits = Double(userInput) {
            carbonOffsetCalculator.sellCarbonCredits(credits: amountOfCredits)
            print("carbonCredit.boughtCarbonCredits = \(carbonCredit.boughtCarbonCredits)")
            print("carbonFootprintData.carbonCreditLimit(after)= \(carbonFootprintData.carbonCreditLimit)")
        } else {
            print("Optional binding failed!")
            print("Try giving a Int or Double value.")
            print("Trying again...")
            fetchRequiredCreditInputs()
        }
    }
}

