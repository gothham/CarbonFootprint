//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

import Foundation

class CFCalculatorController {
    
    static let shared = CFCalculatorController()
    
    let cfCalculator = CarbonFootprintCalculator()
    
    func handleUserInput(option: CalculatorCategoryOption) {
        
        let menuLogicView = MenuLogicView()
        switch option {
        case .back:
            print("Going back..")
            menuLogicView.displayMenuOption()
        case .transportation:
            getUserInputForTransportation()
        case .electricity:
            print("electricity case excuted!")
            captureElectricityInput()
        case .displayAllFootprint:
            cfCalculator.displayAllFootprint()
        }
    }
    
    func getUserInputForTransportation() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let distanceInput = userInteraction.promptDistance(),
           let fuelConsumptionInput = userInteraction.promptFuelConsumption(),
           let emissionFactorInput = userInteraction.promptEmissionFactor() {
            // unwrapping the optionals
            guard let distance = Double(distanceInput) else { return }
            guard let fuelConsumption = Double(fuelConsumptionInput) else { return }
            guard let emissionFactor = Double(emissionFactorInput) else { return }
            
            let footprint = cfCalculator.calculateFootprintForTransport(distance: distance, fuelConsumption: fuelConsumption, emissionFactor: emissionFactor)
            cfCalculator.updateTotalFootprint(value: footprint)
            print("Total footprint = \(cfCalculator.totalFootprint)")
            calculatorView.showCategory()
        } else {
            print("Invalid input")
        }
    }

    func captureElectricityInput() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let electricityUsageInput = userInteraction.promptMessage(message: "Enter total electricity usage in kWh."),
        let carbonIntensityInput = userInteraction.promptMessage(message: "Enter the carbon intensity of local grid in kg CO2/kWh") {
            // unwrapping the optionals
            guard let electrictyUsage = Double(electricityUsageInput) else { return }
            guard let carbonIntensity = Double(carbonIntensityInput) else { return }
            
            print("Total footprint before = \(cfCalculator.totalFootprint)") //before
            let footprint = cfCalculator.calculateElectricityFootprint(totalElectricityUsage: electrictyUsage, carbonIntensityOfLocalGrid: carbonIntensity)
            cfCalculator.updateTotalFootprint(value: footprint)
            print("Total footprint after = \(cfCalculator.totalFootprint)") // After
            calculatorView.showCategory()
        } else {
            print("Invalid input [else block]")
        }
    }
    
}
