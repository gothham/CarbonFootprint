//
//  FootprintConstant.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 22/05/23.
//

import Foundation

class FootprintConstant {
    
    static let shared = FootprintConstant()
    
    let publicEmissionFactor: Double = 3.2//kg CO2 per liter (12 kg CO2 per gallon)
    
    enum CarbonFactor: Double {
        // carbon factor for different power source
        case coalFirePower = 1.1 //kg CO2 per kilowatt-hour (kg CO2/kWh)
        case naturalGasFiredPower = 0.6 //kg CO2/kWh
        case oilFiredPower = 1.2 //kg CO2/kWh
        case renewableResource = 0
        
    }
}
