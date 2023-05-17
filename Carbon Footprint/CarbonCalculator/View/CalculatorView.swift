//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CalculatorView {
    
    func showCategory() {
        let cfCalculatorController = CFCalculatorController()
        print("1. Calculate transportion footprint.")
        print("2. Calculate diet footprint.")
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = CalculatorCategoryOption(rawValue: userChoice) {
            cfCalculatorController.handleUserInput(option: option)
        } else {
            print("Invalid option! Please try again.")
            showCategory()
        }
    }
    
    func showTransportView() {
        print("Yeah reached showTransportView!")
        let userInteraction = UserInteraction()
        
        let cfCalculator = CarbonFootprintCalculator()
        if let distanceInput: Double = userInteraction.promptValue(),
           let fuelConsumptionInput: Double = userInteraction.promptValue(),
           let emissionFactorInput: Double = userInteraction.promptValue() {
            print(cfCalculator.calculateFootprintForCar(distance: distanceInput, fuelConsumption: fuelConsumptionInput, emissionFactor: emissionFactorInput))
        } else {
            print("Invalid input")
            print("Debug info - else block got excuted in showTransportView()")
        }
        
    }
    
    
//    func babyPullMeCloser(Song: String)
}
