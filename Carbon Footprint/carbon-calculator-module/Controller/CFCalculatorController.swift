//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

//TODO: excute the below statements
/*
 1) Type of footprint that's gonna be added. (Done)
 2) Get the inputs for the user according the activity type.(Done)
 3) Do the calculation internally and add the footprint array. (Done)
 4) Fetch the footprint and display it to the user. (Done)
 5) Searching the footprint.
 */

import Foundation

class CFCalculatorController {
    
    static let shared = CFCalculatorController()
    
    let cfCalculator = CarbonFootprintCalculator()
    
    let view = CFCalculatorView()
    
    func handleUserInputForType(option: ActivityTypeOption) {
        
        let showMainMenu = MenuLogicView()
        let calculatorView = CFCalculatorView()
        
        switch option {
            
        case .transportation:
//            captureTransportInput()
            calcTransfoot()
        case .diet:
            print("Selected diet.")
        case .electricity:
            captureElectricityInput()
        case .household:
            print("Selected household.")
        case .displayFootprint:
            cfCalculator.displayFootprint()
            calculatorView.displayCalculatorMenu()
        case .other:
            print("Selected other.")
        case .back:
            print("Selected go back.")
            showMainMenu.displayMenuOption()
        case .zelda:
            print("Oxytocin making it all okay...")
        }

    }
    
    func captureTransportInput(modeOfTransportation type: TransportationType) {
        
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let distanceInput = userInteraction.promptMessage(message: "|Enter distance travelled (in Km):") {
            
            guard let distance = Double(distanceInput) else { return }
            
            let footprint = cfCalculator.calculateFootprintForTransport(distance: distance, modeOfTransport: type)
            
            cfCalculator.updateTotalFootprint(value: footprint)
            
            calculatorView.displayCalculatorMenu()
            
        } else {
            
            print("Invalid input")
            
        }
        
    }

    func captureElectricityInput() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let electricityUsageInput = userInteraction.promptMessage(message: "Enter total electricity usage (in kWh)."),
        let carbonIntensityInput = userInteraction.promptMessage(message: "Enter the carbon intensity of local grid (in kg CO2/kWh)") {
            // unwrapping the optionals
            guard let electrictyUsage = Double(electricityUsageInput) else { return }
            guard let carbonIntensity = Double(carbonIntensityInput) else { return }
            
            print("Total footprint before = \(cfCalculator.totalFootprint)") //before
            let footprint = cfCalculator.calculateElectricityFootprint(totalElectricityUsage: electrictyUsage, carbonIntensityOfLocalGrid: carbonIntensity)
            cfCalculator.updateTotalFootprint(value: footprint)
            print("Total footprint after = \(cfCalculator.totalFootprint)") // After
            calculatorView.displayCalculatorMenu()
        } else {
            print("Invalid input [else block]")
        }
    }
    
    func calcTransfoot() {
        
        let view = CFCalculatorView()
        
        if let selectedMode = view.promptForTransportationMode() {
            switch selectedMode {
            case .car:
                captureTransportInput(modeOfTransportation: .car)
            case .motorcycle:
                captureTransportInput(modeOfTransportation: .motorcycle)
            case .publicTransport:
                captureTransportInput(modeOfTransportation: .publicTransport)
            case .walking:
                print("Handle walking")
            case .cycling:
                print("Handle cycling")
            case .airTravel:
                captureTransportInput(modeOfTransportation: .airTravel)
            case .none:
                view.displayCalculatorMenu()
            }
        } else {
            print("Invalid input")
            calcTransfoot()
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
    case zelda = 44
    
}

