//
//  CarbonFootprintController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class CarbonFootprintController {
    
    let carbonFootprintModel = CFCarbonFootprinCalcModel()
    let calculatorController = CFCalculatorController()
    let cfCalcualtorView = CalculatorView()
    
    func handleUserInput(selectedOption option: MenuOption) {
        switch option {
        case .calculateCarbonFootprint:
            print("Ethida makale!")
            cfCalcualtorView.showCategory()
        case .addFootprint:
            print("Kumbidi!!")
//            captureUserInput()
        case .exit:
            print("Thanks for using the app :)")
        }
    }
    
    /*func captureUserInput() {
        print("Enter transportation emissions (in kg CO2e):")
        if let transportationInput = readLine(), let transportationEmission = Double(transportationInput) {
//            carbonFootprintModel.transportationEmission = transportationEmission
            print("Working on it")
        } else {
            print("Invalid Input! Please try again.")
            captureUserInput()
        }
        
        print("Enter energy consumption.")
        if let energyInput = readLine(), let energyConsumptionEmission = Double(energyInput) {
            carbonFootprintModel.energyConsumptionEmission = energyConsumptionEmission
        } else {
            print("Invalid input for energy consumption emissions. Please try again.")
            captureUserInput()
        }
        
        print("Total footprint is \(carbonFootprintModel.totalEmission)")
    }*/
}
