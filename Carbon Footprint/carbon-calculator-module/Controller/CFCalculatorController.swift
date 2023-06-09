//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

import Foundation

class CFCalculatorController {
    
    // Singleton class
    static let shared = CFCalculatorController()
    
    // MARK: Instances.
    
    let cfCalculator = CarbonFootprintCalculator()
    
    let carbonFootprintData = CarbonFootprintData()
    
    let view = CFCalculatorView()
    
    // MARK: Methods to handle user into and interate with the modal.
    
    func handleUserInputForType(option: ActivityTypeOption) {
        
        let showMainMenu = MenuLogicView()
        let calculatorView = CFCalculatorView()
        
        switch option {
        case .transportation:
            navigateFrequencyMode()
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
    
    func navigateTransportMode(frequencyType: CarbonFootprintData.FootprintFrequency) {
        
        let view = CFCalculatorView()
        
        if let selectedMode = view.promptForTransportationMode() {
            switch selectedMode {
            case .car:
                captureTransportInput(modeOfTransportation: .car, frequencyType: frequencyType)
            case .motorcycle:
                captureTransportInput(modeOfTransportation: .motorcycle, frequencyType: frequencyType)
            case .publicTransport:
                captureTransportInput(modeOfTransportation: .publicTransport, frequencyType: frequencyType)
            case .walking:
                print("Handle walking")
            case .cycling:
                print("Handle cycling")
            case .airTravel:
                captureTransportInput(modeOfTransportation: .airTravel, frequencyType: frequencyType)
            }
        } else {
            print("Invalid input")
        }
        
    }
    
    
    func navigateFrequencyMode() {
        
        let view = CFCalculatorView()
        
        if let selectedMode = view.promptForFrequencyType() {
            switch selectedMode {
            case .regular:
                navigateTransportMode(frequencyType: .regular)
            case .nonRegular:
                navigateTransportMode(frequencyType: .nonRegular)
            }
        }
    }
    
    
    // MARK: methods for capturing user inputs.
    
    func captureTransportInput(modeOfTransportation type: TransportData.TransportType, frequencyType: CarbonFootprintData.FootprintFrequency) {
        
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        let footprint: Double
        
        switch frequencyType {
        case .regular:
            print("Inside regular capture input method.")
            if let distanceInput = userInteraction.promptMessage(message: "|Enter distance travelled (in Km):"),
               let frequencyInput = userInteraction.promptMessage(message: "|Enter the frequency of travel:") {
                
                guard let frequency = Int(frequencyInput) else { return }
                guard let distance = Double(distanceInput) else { return }
                
                footprint = carbonFootprintData.calculateTransportationEmission(distance: distance, transportMode: type, frequency: frequency, frequencyType: .regular)
                carbonFootprintData.addCarbonFootprint(type: .transport, emissionValue: footprint, frequencyType: frequencyType)
                
            } else {
                
                print("Invalid input")
                
            }
        case .nonRegular:
            print("Inside nonregular capture input method.")
            if let distanceInput = userInteraction.promptMessage(message: "|Enter distance travelled (in Km):") {
                
                guard let distance = Double(distanceInput) else { return }
                
                footprint = carbonFootprintData.calculateTransportationEmission(distance: distance, transportMode: type, frequency: 1, frequencyType: .nonRegular)
                carbonFootprintData.addCarbonFootprint(type: .transport, emissionValue: footprint, frequencyType: frequencyType)
                
            } else {
                
                print("Invalid input")
                
            }
            
        }
        
        // Displaying footprints.
        carbonFootprintData.displayFootprint()
        
        calculatorView.displayCalculatorMenu()
        
    }

    func captureElectricityInput() {
        let userInteraction = UserInteraction()
        let calculatorView = CFCalculatorView()
        
        if let electricityUsageInput = userInteraction.promptMessage(message: "Enter total electricity usage (in kWh)."),
        let carbonIntensityInput = userInteraction.promptMessage(message: "Enter the carbon intensity of local grid (in kg CO2/kWh)") {
            // unwrapping the optionals
            guard let electrictyUsage = Double(electricityUsageInput) else { return }
            guard let carbonIntensity = Double(carbonIntensityInput) else { return }
            
            let footprint = carbonFootprintData.calculateEnergyEmission(totalEnergyConsumption: electrictyUsage, carbonInstensityOfLocalGrid: carbonIntensity)
            
            carbonFootprintData.addCarbonFootprint(type: .energy, emissionValue: footprint, frequencyType: .nonRegular)
            
            carbonFootprintData.displayFootprint()
            
            calculatorView.displayCalculatorMenu()
            
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
    case zelda = 44
    
}

