//
//  CarbonFootprintCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

class CarbonFootprintCalculator {
    
    func calculateFootprintForCar(distance: Double, fuelConsumption: Double, emissionFactor: Double) -> Double {
        let carbonFootprint = distance * fuelConsumption * emissionFactor
        return carbonFootprint
    }

}
