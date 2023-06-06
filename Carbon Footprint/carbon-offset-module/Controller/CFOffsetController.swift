//
//  CFOffsetController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 19/05/23.
//

import Foundation

class CFOffsetController {
    
    static let shared = CFOffsetController()
    
    let menuLogicView = MenuLogicView()
    let offsetManager = OffsetManager()
    let userInteraction = UserInteraction()
    
    func handleUserInput(selectedOption option: OffsetOption) {
        
        switch option {
            
        case .showMarketplace:
            // TODO: Handle show marketplace case
            offsetManager.showAvailableCredits()
            CFOffsetView.shared.displayOffsetMenu()
        case .buyCredit:
            // TODO: Handle buy credit option.
            print("Buy credit portal.")
            getUserInputForBuyCredit()
            CFOffsetView.shared.displayOffsetMenu()
        case .sellCredit:
            // TODO: Handle sell credit option.
            print("Sell credit portal.")
            getUserInputForSellCredit()
            CFOffsetView.shared.displayOffsetMenu()
        case .back:
            // TODO: Take the user back.
            print("Wanna go back?")
            menuLogicView.displayMenuOption()
        }
        
    }
    
    func getUserInputForBuyCredit() {
        // Display the available credits.
        offsetManager.showAvailableCredits()
        if let indexInput = userInteraction.promptMessage(message: "Enter the index of the credit you wish to buy:"),
           let quatityInput = userInteraction.promptMessage(message: "Enter the quantity of credits required:") {
            guard let atIndex = Int(indexInput) else { return }
            guard let quantity = Int(quatityInput) else { return }
            offsetManager.buyCarbonCredit(atIndex: atIndex, quantity: quantity)
            offsetManager.showAvailableCredits()
        }
    }
    
    func getUserInputForSellCredit() {
        if let quatityInput = userInteraction.promptMessage(message: "How many credits do you want to sell? :"),
            let priceInput = userInteraction.promptMessage(message: "Enter price for a single credit:") {
            
            guard let quantity = Int(quatityInput) else { return }
            guard let price = Double(priceInput) else { return }
            
            offsetManager.sellCarbonCredits(quantity: quantity, price: price)
               
        }
        
    }
    
}
