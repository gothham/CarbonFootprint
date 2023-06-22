//
//  CarbonOffsetCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 20/06/23.
//

import Foundation

class CarbonOffsetCalculator {
    
    let carbonFootprintData: CarbonFootprintData
    let revampedCarbonCredit: RevampedCarbonCredit
    
    init(carbonFootprintData: CarbonFootprintData, revampedCarbonCredit: RevampedCarbonCredit) {
        self.carbonFootprintData = carbonFootprintData
        self.revampedCarbonCredit = revampedCarbonCredit
    }
    
    // MARK: Methods to check and update carbon offset
    
    func isOffsettingRequired() -> Bool {
        return RCarbonFootprint.totalFootprint > carbonFootprintData.carbonCreditLimit
    }
    
    func calculateBufferEmission() -> Double {
        return max(0, RCarbonFootprint.totalFootprint - carbonFootprintData.carbonCreditLimit)
    }
    
    func calculateCreditsRequired(bufferValue: Double) -> Double {
        let requiredCredits = bufferValue / 1000
        return requiredCredits
    }
    
    func evaluateTotalCreditsRequired() -> Double {
        guard isOffsettingRequired() else { return 0 }
        
        let bufferValue = calculateBufferEmission()
        let requiredCredits = calculateCreditsRequired(bufferValue: bufferValue)
        updateRequiredCredits(creditsRequired: requiredCredits)
        
        return requiredCredits
    }
    
    func updateCarbonCreditLimit() {
        carbonFootprintData.carbonCreditLimit = RCarbonFootprint.totalFootprint
        RCarbonFootprint.totalFootprint += carbonFootprintData.carbonCreditLimit
    }
    
    func updateRequiredCredits(creditsRequired: Double) {
//        revampedCarbonCredit.bougthCarbonCredits = creditsRequired
    }
}
