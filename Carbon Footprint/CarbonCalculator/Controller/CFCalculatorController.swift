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
        case .diet:
            print("Diet case excuted")
        }
    }
    
    func getUserInputForTransportation() {
        let userInteraction = UserInteraction()
        
        if let distanceInput = userInteraction.promptDistance(),
           let fuelConsumptionInput = userInteraction.promptFuelConsumption(),
           let emissionFactorInput = userInteraction.promptEmissionFactor() {
            let distance = Double(distanceInput)!
            let fuelConsumption = Double(fuelConsumptionInput)!
            let emissionfactor = Double(emissionFactorInput)!
            
            let footprint = cfCalculator.calculateFootprintForCar(distance: distance, fuelConsumption: fuelConsumption, emissionFactor: emissionfactor)
            cfCalculator.addFootprint(footprint: footprint)
            print("Total footprint = \(cfCalculator.totalFootprint)")
            
        } else {
            print("Invalid input")
        }
    }

    
}
