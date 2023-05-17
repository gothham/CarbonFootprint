//
//  CFCalcModel.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class CFCarbonFootprinCalcModel {
    
    var distanceTravelled: Double = 0.0
    let emissionFactor: Double = 0.2
    var energyConsumptionEmission: Double = 0.0
    var wasteEmission: Double = 0.0
    var waterUsageEmissions: Double = 0.0
    
    var transportationEmission: Double {
        distanceTravelled * emissionFactor
    }
    
    var totalEmission: Double {
        transportationEmission + energyConsumptionEmission + wasteEmission + waterUsageEmissions
    }
    
//    mutating func calculateTransportationEmission(distanceTravelled displacement: Double) {
//        return transportationEmission = displacement * emissionFactor
//    }
    
}
