//
//  CarbonGoal.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

import Foundation

class CarbonGoal {
    
    var goals: [Goal] = [/*Montero*/]
    
    var nextGoalId: Int = 0
    
    func addGoal(description: String, targetEmissionReduction: Double, type: GoalMenuView.GoalType) {
        
        let goalId = getGoalId()
        
        let goal = Goal(id: goalId, type: type, progress: 0, targetEmissionReduction: targetEmissionReduction, description: description)
        
        goals.append(goal)
        
        func getGoalId() -> Int{
            
            var currentId = nextGoalId
            currentId += 1
            nextGoalId = currentId
            return currentId
            
        }

    }
    
    func addReductionValue(value: Double,to goalId: UUID) {
        // TODO: addReductionValue after fetching the correct goal using ID probably
    }
    
    
    func displayAllGoal() {
        
        guard !goals.isEmpty else {
            print("No active goals.")
            return
        }
        
        for goal in goals {
            print("(Goal ID: \(goal.id), Type: \(goal.type), Progress: \(goal.progress), Target Emission Reduction: \(goal.targetEmissionReduction),Description: \(goal.description))")
        }
        
    }
    
}
