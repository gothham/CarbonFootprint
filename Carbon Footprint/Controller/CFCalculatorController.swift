//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class CFCalculatorController {
    
    let carbonFootprintModel = CFCarbonFootprinCalcModel()
    
    func handleCalcOptionInput(option selectedOption: CFCalculatorOption) {
        switch selectedOption {
        case .calcTransportEmission:
            captureTransportEmissionInput()
        case .calcEnergyConsumption:
            print("Selected option \(selectedOption.rawValue)")
        case .calcWasteEmission:
            print("Selected option \(selectedOption.rawValue)")
        case .calcWaterUsageEmissions:
            print("Selected option \(selectedOption.rawValue)")
        }
    }
    
    func captureTransportEmissionInput() {
        print("Enter distance travelled in kilometers.")
        if let distanceTravelled = readLine(), let displacement = Double(distanceTravelled) {
            carbonFootprintModel.distanceTravelled = displacement
            print(carbonFootprintModel.transportationEmission)
        } else {
            print("Invalid input! Plese try again.")
            captureTransportEmissionInput()
        }
    }
}
