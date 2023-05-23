//
//  CarbonFootprintCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//
/// Calculations for Carbon Footprint
/// Emissions = Total electricity usage (kWh) * Carbon intensity of the local grid (kg CO2/kWh)

import Foundation

class CarbonFootprintCalculator {
    
    var totalFootprint: Double = 0.0
    
    var transportationFootprint: Double = 0.0
    
    var electricityFootprint: Double = 0.0
    
    var dietFootprint: Double = 0.0
    
    var nextFootprintId: Int = 1
    
    var footprints: [CarbonFootprint] = [] // all the footprintys will be add here
    
    
    // TODO: Make this function working...
    // method to add footprint to the footprints array
    func addCarbonFootprint(activityType: ActivityType, emission: Double) {
        
        let footprintId = getNextFootprintId()
        let activity = Activity(type: activityType, emissionFactor: FootprintConstant.shared)
        
        let newCarbonFootprint = CarbonFootprint(footprintId: footprintId, activityType: activity, emission: emission)
        
        // Appending to the array.
        footprints.append(newCarbonFootprint)
        
        // updating the values of specific footprint instances
        switch activityType {
        case .transportation:
            transportationFootprint += emission
        case .electricity:
            electricityFootprint += emission
        case .diet:
            dietFootprint += emission
        }
        
        // Giving a unique footprint
        func getNextFootprintId() -> Int {
            let currentFootprintId = nextFootprintId
            nextFootprintId += 1
            return currentFootprintId
        }
        
    }
    
    /*func calculateFootprintForTransport(distance: Double, fuelConsumption: Double, emissionFactor: Double) -> Double {
        let carbonFootprint = distance * fuelConsumption * emissionFactor
        
        return carbonFootprint
    }*/
    
    func calculateFootprintForTransport(distance: Double, fuelConsumption: Double) -> Double {
        
        let carbonFootprint = distance * fuelConsumption * FootprintConstant.shared.publicEmissionFactor
        addCarbonFootprint(activityType: .transportation, emission: carbonFootprint)
        // printing the footprints array
        displayFootprint()
        return carbonFootprint
    }
    
    func calculateElectricityFootprint(totalElectricityUsage: Double, carbonIntensityOfLocalGrid: Double) -> Double{
        let carbonFootprint = totalElectricityUsage * carbonIntensityOfLocalGrid
        addCarbonFootprint(activityType: .electricity, emission: carbonFootprint)
        displayFootprint()
        return carbonFootprint
    }
    
//    func calculateDietFootprint()
    
    func updateTotalFootprint(value: Double) {
        totalFootprint += value
    }
    
    func addExplicityFootprint(to type: ActivityType, value: Double) {
        switch type {
        case .transportation:
            transportationFootprint += value
        case .electricity:
            electricityFootprint += value
        case .diet:
            dietFootprint += value
        }
    }

    func displayAllFootprint() {
        print()
        print("Total Footprint is \(totalFootprint)")
        print("Transportation Footprint: \(transportationFootprint)")
        print("Electricity Footprint: \(electricityFootprint)")
    }
    
    func displayFootprint() {
        for footprint in footprints {
            print("(Footprint ID: \(footprint.footprintId), Activity type: \(footprint.activityType.type), Emission Value: \(footprint.emission))")
        }
    }
    
}

