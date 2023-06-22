//
//  FootprintValidation.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 12/06/23.
//

import Foundation

class FootprintValidation {
    
    func validateFootprint(footprintValue value: Double) {
        
        guard value > 100_000_000 else { return } // checking if the carbon footprint is above the maximum limit
        
        // TODO: call the appropriate method for offsetting the carbon footprint
    }
}
