//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CFCalculatorView {
    
    func showCategory() {
        let cfCalculatorController = CFCalculatorController()
        print("Carbon footprint calculator")
        print("1. Calculate transportion footprint.")
        print("2. Calculate diet footprint.")
        print("0. Go back")
        print("Please select an option (Number)")
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = CalculatorCategoryOption(rawValue: userChoice) {
            cfCalculatorController.handleUserInput(option: option)
        } else {
            print("Invalid option! Please try again.")
            showCategory()
        }
    }
    
    
//    func babyPullMeCloser(Song: String)
    
    /*func showTransportView() {
        let userInteraction = UserInteraction()
        let cfCalculator = CarbonFootprintCalculator()
        print("Yeah reached showTransportView!")
        
        if let distanceInput: Double = userInteraction.promptValue() {
           print(distanceInput)
        } else {
            print("Invalid input")
            print("Debug info - else block got excuted in showTransportView()")
        }
        
    }*/
}
