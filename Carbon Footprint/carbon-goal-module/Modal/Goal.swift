//
//  Goal.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

struct Goal {
    let id: Int
    let type: GoalMenuView.GoalType
    var progress: Double
    let targetEmissionReduction: Double
    let description: String
    var targetLeft: Double
    
    mutating func updateProgress(with emissionValue: Double) {
        guard emissionValue <= targetEmissionReduction else {
            print("Larger than target emission!")
            return
        }
        
        progress += (emissionValue / targetEmissionReduction) * 100
        targetLeft -= max(targetEmissionReduction - emissionValue, 0)
    }
    
    /*mutating func updateProgress(with emissionValue: Double) {
        guard emissionValue <= targetEmissionReduction else {
            print("Larger than target emission!")
            return
        }
        
        let updatedProgress = (emissionValue / targetEmissionReduction) * 100
        progress += max(progress, updatedProgress) // Update progress only if the new value is higher
        
        targetLeft = max(targetEmissionReduction - emissionValue, 0) // Ensure targetLeft is never negative
    }*/
}
