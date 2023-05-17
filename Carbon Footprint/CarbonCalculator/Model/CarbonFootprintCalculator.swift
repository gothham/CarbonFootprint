//
//  CarbonFootprintCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

class CarbonFootprintCalculator {
    
    var totalFootprint: Double = 0.0
    
    var transportationFootprint: Double = 0.0
    
    func calculateFootprintForCar(distance: Double, fuelConsumption: Double, emissionFactor: Double) -> Double {
        let carbonFootprint = distance * fuelConsumption * emissionFactor
        return carbonFootprint
    }

    func addFootprint(footprint: Double) {
        totalFootprint += footprint
    }

}
