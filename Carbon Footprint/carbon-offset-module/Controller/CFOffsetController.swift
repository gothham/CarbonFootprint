//
//  CFOffsetController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 19/05/23.
//

import Foundation

class CFOffsetController {
    
    let menuLogicView = MenuLogicView()
    let offsetManager = OffsetManager()
    let userInteraction = UserInteraction()
    
    func handleUserInput(selectedOption option: OffsetOption) {
        let offsetView = CFOffsetView()
        switch option {
        case .showMarketplace:
            // TODO: Handle show marketplace case
            offsetManager.showAvailableCredits()
            offsetView.displayOffsetMenu()
        case .buyCredit:
            // TODO: Handle buy credit option.
            print("Buy credit portal.")
            getUserInputForBuyCredit()
            offsetView.displayOffsetMenu()
        case .sellCredit:
            // TODO: Handle sell credit option.
            print("Sell credit portal.")
            getUserInputForSellCredit()
            offsetView.displayOffsetMenu()
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
        offsetManager.showAvailableCredits()
        if let indexInput = userInteraction.promptMessage(message: "Enter the index of the credit you wish to sell:"),
           let quatityInput = userInteraction.promptMessage(message: "Enter the quantity of credits required:"),
           let priceInput = userInteraction.promptMessage(message: "Enter the selling price:")
        {
            guard let atIndex = Int(indexInput) else { return }
            guard let quantity = Int(quatityInput) else { return }
            guard let price = Double(priceInput) else { return }
            offsetManager.sellCarbonCredits(atIndex: atIndex, quantity: quantity, price: price)
            offsetManager.showAvailableCredits()
        }
    }
}
