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
    let reductionValue: Double = 0.0
    let description: String
    
    mutating func updateProgress(with reductionValue: Double) {
        
        let leftOverEmissionValue = targetEmissionReduction - reductionValue
        progress = (leftOverEmissionValue/100) * targetEmissionReduction
        
    }
    
}
