//
//  RCarbonFootprint.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 08/06/23.
//

import Foundation

class RCarbonFootprint {
    
    static var totalFootprint: Double = 0.0
    
    let footprintId: Int
    
    let emissionValue: Double
    
    let majorActivityType: EmissionType
    
    init(footprintId: Int, emissionValue: Double, majorActivityType: EmissionType) {
        self.footprintId = footprintId
        self.emissionValue = emissionValue
        self.majorActivityType = majorActivityType
        
        RCarbonFootprint.totalFootprint += emissionValue
    }
}
