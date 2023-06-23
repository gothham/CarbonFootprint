//
//  CarbonFootprintData.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 07/06/23.
//

import Foundation

class CarbonFootprintData {
    static let shared = CarbonFootprintData()
    private init() {}
    
    var carbonCreditLimit: Double = 100_000_000.0
    var totalFootprintInMetricTon: Double = 0.0
    var nextFootprintId: Int = 1
    var footprints: [RCarbonFootprint] = []
    
    enum FootprintFrequency: Int, CaseIterable {
        case regular = 1
        case nonRegular = 2
    }
    
    func calculateTransportationEmission(distance: Double, transportMode: TransportData.TransportType, frequency: Int, frequencyType: FootprintFrequency) -> Double {
        var fuelConsumption: Double = 0.0
        let fuelEfficiency = ModeOfTransportMileage()
        var carbonFootprint: Double
        
        switch transportMode {
        case .car:
            fuelConsumption = distance * fuelEfficiency.carMileage
        case .motorcycle:
            fuelConsumption = distance * fuelEfficiency.motorcycleMileage
        case .publicTransport:
            fuelConsumption = distance * fuelEfficiency.publicTransportMileage
        case .walking:
            print("Walking has 0 mileage!")
        case .cycling:
            print("Cycling doesn't consume fuel!")
        case .airTravel:
            fuelConsumption = distance * fuelEfficiency.airTravelMileage
        }
        
        switch frequencyType {
        case .regular:
            carbonFootprint = distance * FootprintConstant.shared.publicEmissionFactor * fuelConsumption * Double(frequency)
        case .nonRegular:
            carbonFootprint = distance * FootprintConstant.shared.publicEmissionFactor * fuelConsumption
        }
        
        return carbonFootprint
    }
    
    func calculateEnergyEmission(totalEnergyConsumption energyUsed: Double, carbonIntensityOfLocalGrid carbonIntensity: Double) -> Double {
        return energyUsed * carbonIntensity
    }
    
    func addCarbonFootprint(type emissionType: EmissionType, emissionValue: Double, frequencyType: FootprintFrequency) {
        let footprintId = getNextFootprintId()
        let carbonFootprint = RCarbonFootprint(footprintId: footprintId, emissionValue: emissionValue, majorActivityType: emissionType)
        
        footprints.append(carbonFootprint)
        
        RCarbonFootprint.totalFootprint += emissionValue
    }
    
    func getNextFootprintId() -> Int {
        let currentFootprintId = nextFootprintId
        nextFootprintId += 1
        return currentFootprintId
    }
    
    func getCurrentFootprintId() -> Int {
        return nextFootprintId - 1
    }
    
    func displayFootprint() {
        if footprints.isEmpty {
            print("No active footprints!")
            return
        }
        
        for footprint in footprints {
            print("(Footprint ID: \(footprint.footprintId), Type: \(footprint.majorActivityType), Emission value: \(footprint.emissionValue))")
        }
    }
    
    func convertToTon(emissionValueInTons value: Double) -> Double {
        return value / 1000 // Converting to metric tonne
    }
    
    func fetchFootprint(footprintId id: Int) -> RCarbonFootprint? {
        return footprints.first(where: { $0.footprintId == id })
    }
    
    func updateProgressUsingFootprint(footprintId: Int, goalId: Int) {
        guard let footprint = fetchFootprint(footprintId: footprintId) else { return }
        AddGoalController.shared.carbonGoal.updateGoalProgress(goalId: goalId, reductionValue: footprint.emissionValue)
    }
    
    func reduceTotalFootprint(with value: Double) {
        RCarbonFootprint.totalFootprint -= value
        print("Total footprint = \(RCarbonFootprint.totalFootprint)")
    }
}
