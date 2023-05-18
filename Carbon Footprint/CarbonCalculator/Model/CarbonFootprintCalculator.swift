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
    
    func calculateFootprintForCar(distance: Double, fuelConsumption: Double, emissionFactor: Double) -> Double {
        let carbonFootprint = distance * fuelConsumption * emissionFactor
        return carbonFootprint
    }
    
    func calculateHouseholdFootprint(totalElectricityUsage: Double, carbonIntensityOfLocalGrid: Double) -> Double{
        let carbonFootprint = totalElectricityUsage * carbonIntensityOfLocalGrid
        return carbonFootprint
    }
    
//    func 

}
