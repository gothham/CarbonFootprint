//
//  RCarbonFootprint.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 08/06/23.
//

import Foundation

class RCarbonFootprint {
    
    let footprintId: Int
    
    let emissionValue: Double
    
    let majorActivityType: EmissionType
    
    init(footprintId: Int, emissionValue: Double, majorActivityType: EmissionType) {
        self.footprintId = footprintId
        self.emissionValue = emissionValue
        self.majorActivityType = majorActivityType
    }
    
}
