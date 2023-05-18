//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

import Foundation

class CFCalculatorController {
    
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
        }
    }
    
    func getUserInputForTransportation() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let distanceInput = userInteraction.promptDistance(),
           let fuelConsumptionInput = userInteraction.promptFuelConsumption(),
           let emissionFactorInput = userInteraction.promptEmissionFactor() {
            let distance = Double(distanceInput)!
            let fuelConsumption = Double(fuelConsumptionInput)!
            let emissionfactor = Double(emissionFactorInput)!
            
            let footprint = cfCalculator.calculateFootprintForCar(distance: distance, fuelConsumption: fuelConsumption, emissionFactor: emissionfactor)
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
//            let electrictyUsage = Double(electricityUsageInput)!
//            let carbonIntensity = Double(carbonIntensityInput)!
            guard let electrictyUsage = Double(electricityUsageInput) else { return }
            guard let carbonIntensity = Double(carbonIntensityInput) else { return }
            
            
            let footprint = cfCalculator.calculateHouseholdFootprint(totalElectricityUsage: electrictyUsage, carbonIntensityOfLocalGrid: carbonIntensity)
            print("Total footprint = \(cfCalculator.totalFootprint)")
            calculatorView.showCategory()
        } else {
            print("Invalid input [else block]")
        }
    }
    
}
