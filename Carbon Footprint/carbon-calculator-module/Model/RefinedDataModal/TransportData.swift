//
//  TransportData.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 07/06/23.
//

import Foundation

class TransportData {
    
    enum TransportType: Int {
    
        case car  = 1
        case motorcycle = 2
        case publicTransport = 3
        case walking = 4
        case cycling = 5
        case airTravel = 6
    
    }
    
    let footprintId: Int
    
    let transportationMode: TransportType
    
    let frequency: Int
    
    let displacement: Double
    
    let emission: Double
    
    var transportFootprints: [TransportData] = []
    
    init(footprintId: Int, transportationMode: TransportType, frequency: Int, displacement: Double, emission: Double) {
        self.footprintId = footprintId
        self.transportationMode = transportationMode
        self.frequency = frequency
        self.displacement = displacement
        self.emission = emission
    }
    
    func addCarbonFootprint(id footprintId: Int, transportMode: TransportType, frequency: Int, distance displacement: Double, emission: Double) {
        
        let transportFootprint = TransportData(footprintId: footprintId, transportationMode: transportMode, frequency: frequency, displacement: displacement, emission: emission)
        
        transportFootprints.append(transportFootprint)
        
    }
    
}
