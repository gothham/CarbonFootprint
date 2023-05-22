//
//  CarbonFootprintCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//
/// Calculations for Carbon Footprint
/// Emissions = Total electricity usage (kWh) * Carbon intensity of the local grid (kg CO2/kWh)

import Foundation

class CarbonFootprintCalculator {
    
    var totalFootprint: Double = 0.0
    
    var transportationFootprint: Double = 0.0
    
    var electricityFootprint: Double = 0.0
    
    var dietFootprint: Double = 0.0
    
    var footprints: [CarbonFootprint] = []
    
    func calculateFootprintForTransport(distance: Double, fuelConsumption: Double, emissionFactor: Double) -> Double {
        let carbonFootprint = distance * fuelConsumption * emissionFactor
        return carbonFootprint
    }
    
    func calculateElectricityFootprint(totalElectricityUsage: Double, carbonIntensityOfLocalGrid: Double) -> Double{
        let carbonFootprint = totalElectricityUsage * carbonIntensityOfLocalGrid
        return carbonFootprint
    }
    
//    func calculateDietFootprint()
    
    func updateTotalFootprint(value: Double) {
        totalFootprint += value
    }
    
    func addFootprint(to type: EmissionType, value: Double) {
        switch type {
        case .transportation:
            transportationFootprint += value
        case .electricity:
            electricityFootprint += value
        case .diet:
            dietFootprint += value
        }
    }

    func displayAllFootprint() {
        print("Total Footprint is \(totalFootprint)")
        print("Transportation Footprint: \(transportationFootprint)")
        print("Electricity Footprint: \(electricityFootprint)")
    }
}

