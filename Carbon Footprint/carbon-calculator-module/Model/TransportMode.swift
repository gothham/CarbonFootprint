//
//  TransportMode.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 06/06/23.
//

import Foundation

class TransportMode {
    
    let name: String
    
    let value: Double
    
    let frequency: Int
    
    let averageDistance: Double
    
    init(name: String, value: Double, frequency: Int, averageDistance: Double) {
        self.name = name
        self.value = value
        self.frequency = frequency
        self.averageDistance = averageDistance
    }
    
}
