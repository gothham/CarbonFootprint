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
    
    enum FootprintFrequency: Int, CaseIterable {
        
        case regular = 1
        
        case nonRegular = 2
        
    }
    
//    var totalFootprint: Double = 0.0
    
    var carbonCreditLimit: Double = 100_000_000.0
    
    var totalFooprintInMetricTon: Double = 0.0
    
    var nextFootprintId: Int = 1
    
    var footprints: [RCarbonFootprint] = [] // storage area for footprints
        
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
        ///
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
    
    // Method to get the current footprint
    func getCurrentFootprintId() -> Int {
        
        return nextFootprintId - 1
        
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
    
    // MARK: Method for updating the total footprint
    
    /*func updateTotalFootprint(emissionValue value: Double) {
        
        totalFootprint += value
        
        totalFooprintInMetricTon = convertToTon(emissionValueInTons: totalFootprint)
        
        displayTotalFootprint()
        
    }*/
    
    func displayTotalFootprint() {
        print("Total footprint in metric tonne is \(totalFooprintInMetricTon) metric ton of Co2.")
        
        print("Total footprint is \(RCarbonFootprint.totalFootprint) kg of Co2.")
    }
    
    func convertToTon(emissionValueInTons value: Double) -> Double {
        let metricTon = value / 1000 // converting to metric tonne
        
        return metricTon
    }
    
    // MARK: Methods for updating
    func fetchFootprint(footprintId id: Int) -> RCarbonFootprint? {
        
        return footprints.first(where: { $0.footprintId == id})
        
    }
    
    func updateProgressUsingFootprint(footprintId: Int, goalId: Int) {
        guard let footprint = fetchFootprint(footprintId: footprintId) else { return } // fetching the required footprint
        
        AddGoalController.shared.carbonGoal.updateGoalProgress(index: goalId, reductionValue: footprint.emissionValue)
        AddGoalController.shared.carbonGoal.displayAllGoal()
    }
    
    func reduceTotalFootprint(with value: Double) {
        
        RCarbonFootprint.totalFootprint -= value
        print("Total footprint = \(RCarbonFootprint.totalFootprint)")
    }
}
