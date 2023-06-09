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
    
    var footprints: [CarbonFootprint] = [] // all the footprinty will be add here
    
    
    // TODO: Make this function working...
    // method to add footprint to the footprints array
    func addCarbonFootprint(activityType: ActivityType, emission: Double, modeOfTransportation: TransportationType) {
        
        let footprintId = getNextFootprintId()
        let activity = Activity(type: activityType, emissionFactor: FootprintConstant.shared)
        
        let newCarbonFootprint = CarbonFootprint(footprintId: footprintId, activityType: activity, emission: emission, transportationMode: modeOfTransportation)
        
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
    
    func calculateFootprintForTransport(distance: Double, modeOfTransport: TransportationType) -> Double {
        
        let mileage = ModeOfTransportMileage()
        
        var fuelConsumption: Double = 0.0
        
        switch modeOfTransport {
        case .car:
            fuelConsumption = distance * mileage.carMileage
        case .motorcycle:
            fuelConsumption = distance * mileage.motorcycleMileage
        case .publicTransport:
            fuelConsumption = distance * mileage.publicTransportMileage
        case .walking:
            print("Walking haha, 0 mileage bruh!")
        case .cycling:
            print("Use brains... You dumbass!")
        case .airTravel:
            fuelConsumption = distance * mileage.airTravelMileage
        case .none:
            print("Eat five star do nothing!")
        }

        let carbonFootprint = distance * FootprintConstant.shared.publicEmissionFactor * fuelConsumption
        
        addCarbonFootprint(activityType: .transportation, emission: carbonFootprint, modeOfTransportation: modeOfTransport)
        
        displayFootprint()
        
        return carbonFootprint
        
    }
    
    func calculateElectricityFootprint(totalElectricityUsage: Double, carbonIntensityOfLocalGrid: Double) -> Double{
        let carbonFootprint = totalElectricityUsage * carbonIntensityOfLocalGrid
        addCarbonFootprint(activityType: .electricity, emission: carbonFootprint, modeOfTransportation: .none)
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

    // MARK: Display explicit footprints
    func displayAllFootprint() {
        
        print("Total Footprint is \(totalFootprint) kg of Co2e.")
        print("Transportation Footprint: \(transportationFootprint) kg of Co2e.")
        print("Electricity Footprint: \(electricityFootprint) kg of Co2e.")
        
    }
    
    // MARK: Display footprints
    func displayFootprint() {
        
        guard footprints.count > 0 else {
            print("No footprints data.")
            return
        }
        
        for footprint in footprints {
            print("(Footprint ID: \(footprint.footprintId), Activity type: \(footprint.activityType.type), Emission Value: \(footprint.emission), Mode of transportation: \(footprint.transportationMode))")
        }
        
    }
    
    func reduceTotalFootprint(with value: Double) {
        
        totalFootprint -= value
        print("Total footprint = \(totalFootprint)")
    }
    
    
}

