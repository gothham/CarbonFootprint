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
    var reductionValue: Double = 0.0
    let description: String
    var targetLeft: Double
    
    mutating func updateProgress(with emissionValue: Double) {
        
        guard emissionValue <= targetEmissionReduction else { return }
        
        self.reductionValue += emissionValue
        self.progress = (reductionValue/targetEmissionReduction) * 100
        self.targetLeft = targetEmissionReduction - reductionValue
        
    }
    
}
