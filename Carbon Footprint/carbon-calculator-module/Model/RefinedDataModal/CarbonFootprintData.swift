//
//  CarbonFootprintData.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 07/06/23.
//

import Foundation

class CarbonFootprintData {
    
    enum FootprintFrequency: Int, CaseIterable {
        
        case regular = 1
        
        case nonRegular = 2
        
    }
    
    var transportationData: TransportData?
    
    var energyUsage: EnergyData?
    
    var nextFootprintId: Int = 1
    
    var footprints: [RCarbonFootprint] = [] // storage area for footprints
    
    
    /*var totalFootprint: Double {
     
     let transportEmissions = calculateTransportationEmission()
     let energyEmissions = calculateEnergyEmission()
     
     return transportEmissions + energyEmissions
     
     }*/
    
    /*init(transportationData: TransportData, energyUsage: EnergyData) {
     self.transportationData = transportationData
     self.energyUsage = energyUsage
     }*/
    
    
    // MARK: Methods to calculate carbon footprint
    // method to calculate transportation footprint
    func calculateTransportationEmission(distance: Double, transportMode: TransportData.TransportType, frequency: Int, frequencyType: FootprintFrequency) -> Double {
        
        var fuelConsumption: Double = 0.0
        
        let fuelEfficiency = ModeOfTransportMileage()
        
        var carbonFootprint: Double
        
        // Getting fuelConsumptionvalues for different types.
        switch transportMode {
        case .car:
            fuelConsumption = distance * fuelEfficiency.carMileage
        case .motorcycle:
            fuelConsumption = distance * fuelEfficiency.motorcycleMileage
        case .publicTransport:
            fuelConsumption = distance * fuelEfficiency.publicTransportMileage
        case .walking:
            print("Walking haha, 0 mileage bruh!")
        case .cycling:
            print("Use brains... You dumbass!")
        case .airTravel:
            fuelConsumption = distance * fuelEfficiency.airTravelMileage
        }
        
        // Calcualting the carbon footprint depending upon frequency type
        /// Formula is footprint = distance * emission factor * fuel consumed for the trip
        switch frequencyType {
        case .regular:
            carbonFootprint = distance * FootprintConstant.shared.publicEmissionFactor * fuelConsumption
            carbonFootprint *= Double(frequency)
        case .nonRegular:
            carbonFootprint = distance * FootprintConstant.shared.publicEmissionFactor * fuelConsumption
        }
        
        return carbonFootprint
        
    }
    
    func calculateEnergyEmission(totalEnergyConsumption energyUsed: Double, carbonInstensityOfLocalGrid carbonIntensity: Double) -> Double {
        
        let carbonFootprint = energyUsed * carbonIntensity
        
        return carbonFootprint
        
    }
    
    // MARK: Method to add carbon footprint
    
    func addCarbonFootprint(type emissionType: EmissionType, emissionValue: Double, frequencyType: FootprintFrequency) {
        
        let footprintId = getNextFootprintId()
        
        let carbonFootprint: RCarbonFootprint
        
        switch emissionType {
        case .transport:
            switch frequencyType {
            case .regular:
                carbonFootprint = RCarbonFootprint(footprintId: footprintId, emissionValue: emissionValue, majorActivityType: emissionType)
                footprints.append(carbonFootprint)
                
            case .nonRegular:
                carbonFootprint = RCarbonFootprint(footprintId: footprintId, emissionValue: emissionValue, majorActivityType: emissionType)
                footprints.append(carbonFootprint)
            }
        case .energy:
            carbonFootprint = RCarbonFootprint(footprintId: footprintId, emissionValue: emissionValue, majorActivityType: emissionType)
            footprints.append(carbonFootprint)
        }
        
        func getNextFootprintId() -> Int {
            
            let currentFootprintId = nextFootprintId
            nextFootprintId += 1
            return currentFootprintId
        }
    }
    
    // MARK: Method to display added footprints.
    
    func displayFootprint() {
        guard !footprints.isEmpty else {
            print("No active footprints!")
            return
        }
        
        for footprint in footprints {
            print("(Footprint ID: \(footprint.footprintId), Type: \(footprint.majorActivityType), Emission value: \(footprint.emissionValue))")
        }
        
    }
    
}
