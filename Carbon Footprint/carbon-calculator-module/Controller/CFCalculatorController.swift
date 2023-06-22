//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//
// TODO: uncomment the below code for updating the goal
import Foundation

class CFCalculatorController {
    
    // Singleton class
    static let shared = CFCalculatorController()
    
    private init() {}
    
    // MARK: Instances.
    
    let view = CFCalculatorView()
    
    // MARK: Methods to handle user into and interate with the modal.
    
    func handleUserInputForType(option: ActivityTypeOption) {
        
        let showMainMenu = MenuLogicView()
        
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
            CarbonFootprintData.shared.displayFootprint()
            view.displayCalculatorMenu()
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
            view.displayCalculatorMenu()
        }
    }
    
    func navigateUpdateGoalProgress() {
        if let selectedMode = view.prompUpdateGoalProgress() {
            switch selectedMode {
            case .update:
                print("Hello world")
                
            case .doNotUpdate:
                print("Again hello world")
            }
        }
    }
    
    
    func navigateFrequencyMode() {
        if let selectedMode = view.promptForFrequencyType() {
            switch selectedMode {
            case .regular:
                navigateTransportMode(frequencyType: .regular)
                
            case .nonRegular:
                navigateTransportMode(frequencyType: .nonRegular)
            }
        } else {
            navigateFrequencyMode()
        }
    }
    
    func navigateUpdateGoal() {
        if let selectedMode = view.prompUpdateGoalProgress() {
            switch selectedMode {
            case .update:
                captureGoalId()
                
            case .doNotUpdate:
                view.displayCalculatorMenu()
            }
        }
    }
    
    
    // MARK: methods for capturing user inputs.
    
    func captureTransportInput(modeOfTransportation type: TransportData.TransportType, frequencyType: CarbonFootprintData.FootprintFrequency) {
        let userInteraction = UserInteraction()
        let footprint: Double
        
        switch frequencyType {
        case .regular:
            print("Inside regular capture input method.")
            if let distanceInput = userInteraction.promptMessage(message: "|Enter distance travelled (in Km):"),
               let frequencyInput = userInteraction.promptMessage(message: "|Enter the frequency of travel:") {
                
                guard let frequency = Int(frequencyInput) else { return }
                guard let distance = Double(distanceInput) else { return }
                
                footprint = CarbonFootprintData.shared.calculateTransportationEmission(distance: distance, transportMode: type, frequency: frequency, frequencyType: .regular)
                CarbonFootprintData.shared.addCarbonFootprint(type: .transport, emissionValue: footprint, frequencyType: frequencyType)
//                navigateUpdateGoal()
                CarbonFootprintData.shared.displayFootprint()   
            } else {
                print("Invalid input")
            }
        case .nonRegular:
            if let distanceInput = userInteraction.promptMessage(message: "|Enter distance travelled (in Km):") {
                
                guard let distance = Double(distanceInput) else { return }
                
                footprint = CarbonFootprintData.shared.calculateTransportationEmission(distance: distance, transportMode: type, frequency: 1, frequencyType: .nonRegular)
                CarbonFootprintData.shared.addCarbonFootprint(type: .transport, emissionValue: footprint, frequencyType: frequencyType)
//                navigateUpdateGoal()
                CarbonFootprintData.shared.displayFootprint()
            } else {
                
                print("Invalid input")
                
            }
            
        }
        
        print("Total footprint = \(RCarbonFootprint.totalFootprint)")
        view.displayCalculatorMenu()
    }

    func captureElectricityInput() {
        let userInteraction = UserInteraction()
        
        if let electricityUsageInput = userInteraction.promptMessage(message: "Enter total electricity usage (in kWh)."),
        let carbonIntensityInput = userInteraction.promptMessage(message: "Enter the carbon intensity of local grid (in kg CO2/kWh)") {
            // unwrapping the optionals
            guard let electrictyUsage = Double(electricityUsageInput) else { return }
            guard let carbonIntensity = Double(carbonIntensityInput) else { return }
            
            let footprint = CarbonFootprintData.shared.calculateEnergyEmission(totalEnergyConsumption: electrictyUsage, carbonInstensityOfLocalGrid: carbonIntensity)
            
            CarbonFootprintData.shared.addCarbonFootprint(type: .energy, emissionValue: footprint, frequencyType: .nonRegular)
            
            //navigateUpdateGoal()
            
            CarbonFootprintData.shared.displayFootprint()
            
            view.displayCalculatorMenu()
        } else {
            print("Invalid input [else block]")
        }
    }
    
    func captureGoalId() {
        
        let userInteraction = UserInteraction()
        
        if let goalId = userInteraction.promptMessage(message: "Enter the goal id:"), let selectedGoal = Int(goalId) {
            let currentFootprint = CarbonFootprintData.shared.getCurrentFootprintId()
            print("Current footprint id = \(currentFootprint)")
            CarbonFootprintData.shared.displayFootprint()
            CarbonFootprintData.shared.updateProgressUsingFootprint(footprintId: currentFootprint, goalId: selectedGoal)
            AddGoalController.shared.carbonGoal.displayAllGoal()
        } else {
            print("Invalid input ig?!")
        }
    }
    
}

// MARK: Enum to choose the calculator menu (May remove in the future while switching to UI app).
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


