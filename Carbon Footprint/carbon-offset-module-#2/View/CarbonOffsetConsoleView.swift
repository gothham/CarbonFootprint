//
//  GoalConsoleComponentView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/06/23.
//

import Foundation

class CarbonOffsetConsoleView {
    
    // Enum representing purchase confirmation options
    enum PurchaseConfirmationOption: Int {
        case yes = 1
        case no = 2
    }
    
    // Enum representing offset options
    enum OffsetOption: Int {
        case sell = 1
        case buy = 2
        case checkLimit = 3
    }
    
    // Enum representing offset menu categories
    enum OffsetMenuCategory: Int {
        case showStats = 1
        case offsetCarbon = 2
        case goBack = 3
    }
    
    // Prompts the user for purchase confirmation and returns the selected option
    func promptPurchaseConfirmation() -> PurchaseConfirmationOption? {
        print("Do you want to confirm your purchase?")
        print("1. Yes")
        print("2. No")
        
        if let input = readLine(), let selectedOption = Int(input) {
            return PurchaseConfirmationOption(rawValue: selectedOption)
        }
        
        return PurchaseConfirmationOption.no
    }
    
    // Prompts the user for menu selection and handles the selected option
    func promptUserForMenuSelection() -> OffsetMenuCategory? {
        print("")
        print("Select an option from below")
        print("1. Show Stats")
        print("2. Offset Carbon.")
        print("3. Go back.")
        
        if let userInput = readLine(),
           let selectedOption = Int(userInput) {
            return OffsetMenuCategory(rawValue: selectedOption)
        }
        
        return nil
    }
    
    // Prompts the user for offset option and returns the selected offset option
    func promptSelectOffsetOption() -> OffsetOption? {
        print("")
        print("1. Sell Credits.")
        print("2. Buy Credits.")
        print("3. Check Exceeded Limit and Purchase Credit")
        
        if let userInput = readLine(),
           let selectedOption = Int(userInput) {
            return OffsetOption(rawValue: selectedOption)
        }
        
        return nil
    }
}




