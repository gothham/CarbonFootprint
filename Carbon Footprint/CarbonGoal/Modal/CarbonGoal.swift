//
//  CarbonGoal.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class CarbonGoal {
    
    var goals: [Goal] = []
    
    var nextGoalId: Int = 1
    
    func addGoal(description: String, targetDate: Date, targetEmissionReduction: Double) {
        
        let goalId = getGoalId()
        
        let goal = Goal(id: goalId, progress: 0, targetDate: targetDate, targetEmissionReduction: targetEmissionReduction, description: description)
        
        goals.append(goal)
        
        func getGoalId() -> Int{
            
            var currentId = nextGoalId
            currentId += 1
            return currentId
            
        }
        
    }
    
    func addReductionValue(value: Double,to goalId: UUID) {
        // TODO: addReductionValue after fetching the correct goal using ID probably
    }
    
    func displayGoal() {
        
        guard !goals.isEmpty else {
            print("No active goals.")
            return
        }
        
        for goal in goals {
            print("Goal ID: \(goal.id), Progress: \(goal.progress), Target Date: \(goal.targetDate), Target Emission Reduction: \(goal.targetEmissionReduction),Description: \(goal.description)")
        }
        
    }
    
}
