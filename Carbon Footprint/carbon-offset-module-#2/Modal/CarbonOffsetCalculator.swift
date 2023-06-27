//
//  CarbonOffsetCalculator.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 20/06/23.
//

import Foundation

class CarbonOffsetCalculator {
    
    let carbonFootprintData: CarbonFootprintData
    let carbonCredit: RevampedCarbonCredit
    
    init(carbonFootprintData: CarbonFootprintData, revampedCarbonCredit: RevampedCarbonCredit) {
        self.carbonFootprintData = carbonFootprintData
        self.carbonCredit = revampedCarbonCredit
    }
    
    // MARK: - Methods to check and update carbon offset
    
    func isOffsettingRequired() -> Bool {
        return RCarbonFootprint.totalFootprint > carbonFootprintData.carbonCreditLimit
    }
    
    func calculateBufferEmission() -> Double {
        return max(0, RCarbonFootprint.totalFootprint - carbonFootprintData.carbonCreditLimit)
    }
    
    /// Calculates required credits.
    /// - Parameter bufferValue: Double value which is the difference between total footprint and the allowed emission limit.
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
    }
    
    func updateRequiredCredits(creditsRequired: Double) {
        carbonCredit.boughtCarbonCredits = creditsRequired
    }
    
    func comfirmCarbonCreditPurchase() {
        print("Buy credits and update in the data model")
        
        let creditsRequired = evaluateTotalCreditsRequired()
        print("Credits required = \(creditsRequired)")
        
        updateRequiredCredits(creditsRequired: creditsRequired)
        updateCarbonCreditLimit()
        
        print("Updated carbon limit value after buying = \(carbonFootprintData.carbonCreditLimit)")
        print("Credits bought = \(carbonCredit.boughtCarbonCredits)")
    }

    func buyCarbonCredit(requiredCredits credits: Double) {
        carbonCredit.boughtCarbonCredits += credits
        carbonFootprintData.carbonCreditLimit += credits * 1000
    }
    
    func sellCarbonCredits(credits: Double) {
        guard credits > 0 && credits <= carbonCredit.boughtCarbonCredits else {
            print("Insufficient credits")
            return
        }
        
        carbonCredit.boughtCarbonCredits -= credits
        carbonFootprintData.carbonCreditLimit -= credits * 1000
    }
}
