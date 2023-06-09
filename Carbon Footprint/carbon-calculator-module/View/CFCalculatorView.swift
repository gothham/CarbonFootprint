//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CFCalculatorView {
    
    func displayCalculatorMenu() {
        
        print("")
        
        print("|-------------------------------|")
        print("   Carbon footprint calculator.  ")
        print("|-------------------------------|")
        print("Select an activity type👇:")
        print("> 1. Transportation")
        print("> 2. Diet(Yet to be done)")
        print("> 3. Electricity")
        print("> 4. Household (Yet to be done)")
        print("> 5. Other")
        print("> 6. Display footprints")
        print("> 0. Go back")
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = ActivityTypeOption(rawValue: userChoice) {
            CFCalculatorController.shared.handleUserInputForType(option: option)
        } else {
            print("Invalid option! Please try again.")
            displayCalculatorMenu()
        }
        
    }
    
    func promptForTransportationMode() -> TransportData.TransportType? {
        
        print("Choose the transportation mode:")
        print("1. Car")
        print("2. Motorcycle")
        print("3. PublicTransport")
        print("4. walking")
        print("5. Cycling")
        print("6. AirTravel")
        
        /*for mode in TransportData.TransportType.allCases {
            print("- \(mode.rawValue)")
        }*/
        
        print("Enter your choice:")
        
        if let input = readLine(), let inputInInt = Int(input) {
            return TransportData.TransportType(rawValue: inputInInt)
        }
        
        return nil
        
    }
    
    func promptForFrequencyType() -> CarbonFootprintData.FootprintFrequency? {
        
        print("Travel frequency - (Select an option!)")
        print("1. Regular")
        print("2. Non regular")
        
        /*for mode in CarbonFootprintData.FootprintFrequency.allCases {
            print("> \(mode.rawValue)")
        }*/
        
        print("Enter your choice:")
        
        if let input = readLine(), let inputInInt = Int(input) {
            return CarbonFootprintData.FootprintFrequency(rawValue: inputInInt)
        }
        
        return nil
        
    }
    
}
