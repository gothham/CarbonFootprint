//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

//TODO: excute the below statements
/*
 1) Type of footprint that's gonna be added. (Done)
 2) Get the inputs for the user according the activity type.
 3) Do the calculation internally and add the footprint array. (Done)
 4) Fetch the footprint and display it to the user. (Done)
 5) Searching the footprint.
 */

import Foundation

class CFCalculatorController {
    
    static let shared = CFCalculatorController()
    
    let cfCalculator = CarbonFootprintCalculator()
    
//    let showMainMenu = MenuLogicView()
    
   /* func handleUserInput(option: CalculatorCategoryOption) {
        
        let menuLogicView = MenuLogicView()
        switch option {
        case .back:
            print("Going back..")
            menuLogicView.displayMenuOption()
        case .transportation:
            captureTransportInput()
        case .electricity:
            print("electricity case excuted!")
            captureElectricityInput()
        case .displayAllFootprint:
            cfCalculator.displayAllFootprint()
        }
    } */
    
    func handleUserInputForType(option: ActivityTypeOption) {
        
        let showMainMenu = MenuLogicView()
        
        switch option {
            
        case .transportation:
            print("Selected transportation.")
            captureTransportInput()
        case .diet:
            print("Selected diet.")
        case .electricity:
            print("Selected electricity.")
            captureElectricityInput()
        case .household:
            print("Selected household.")
        case .displayFootprint:
            print("Selected displayFootprint.")
            cfCalculator.displayFootprint()
        case .other:
            print("Selected other.")
        case .back:
            print("Selected go back.")
            showMainMenu.displayMenuOption()
        }

    }
    
    func captureTransportInput() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let distanceInput = userInteraction.promptDistance(),
           let fuelConsumptionInput = userInteraction.promptFuelConsumption()
//           let emissionFactorInput = userInteraction.promptEmissionFactor()
        {
            // unwrapping the optionals
            guard let distance = Double(distanceInput) else { return }
            guard let fuelConsumption = Double(fuelConsumptionInput) else { return }
//            guard let emissionFactor = Double(emissionFactorInput) else { return }
            
            let footprint = cfCalculator.calculateFootprintForTransport(distance: distance, fuelConsumption: fuelConsumption)
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


enum  ActivityTypeOption: Int{
    
    case transportation = 1
    case diet = 2
    case electricity = 3
    case household = 4
    case other = 5
    case displayFootprint = 6
    case back = 0
    
}

