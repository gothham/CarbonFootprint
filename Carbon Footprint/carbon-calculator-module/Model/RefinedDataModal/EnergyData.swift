//
//  EnergyData.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 07/06/23.
//

import Foundation

class EnergyData {
    
    enum CarbonIntensity: Double {
        
        case coalFirePower = 1.1 //kg CO2 per kilowatt-hour (kg CO2/kWh)
        case naturalGasFiredPower = 0.6
        case oilFiredPower = 1.2
        case renewableResource = 0.0
        
    }
    
    let electricityConsumption: Double
    
    let emission: Double
    
    init(electricityConsumption: Double, emission: Double) {
        self.electricityConsumption = electricityConsumption
        self.emission = emission
    }
    
    
}
