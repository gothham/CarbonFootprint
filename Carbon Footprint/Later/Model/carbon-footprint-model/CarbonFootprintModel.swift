//
//  CarbonFootprintModel.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class CarbonFootprintModel {
    
    var transportationEmission: Double = 0.0
    var energyComsumptionEmission: Double = 0.0
    var totalCarbonFootprint: Double {
        return transportationEmission + energyComsumptionEmission
    }
    
}
