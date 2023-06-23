//
//  CarbonGoal.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 24/05/23.
//

class CarbonGoal {
    
    private var goals: [Goal] = []
    private var nextGoalId: Int = 1
    
    func addGoal(description: String, targetEmissionReduction: Double, type: GoalMenuView.GoalType) {
        let goalId = getGoalId()
        let goal = Goal(id: goalId, type: type, progress: 0, targetEmissionReduction: targetEmissionReduction, description: description, targetLeft: targetEmissionReduction)
        goals.append(goal)
    }
    
    func addReductionValue(value: Double, to goalId: Int) {
        // TODO: addReductionValue after fetching the correct goal using ID
    }
    
    func displayAllGoals() {
        guard !goals.isEmpty else {
            print("No active goals.")
            return
        }
        
        for goal in goals {
            print("(Goal ID: \(goal.id), Type: \(goal.type), Progress: \(goal.progress)%, Target Emission Reduction: \(goal.targetEmissionReduction), Description: \(goal.description), Target Left: \(goal.targetLeft))")
        }
    }
    
    func fetchGoal(withId goalId: Int) -> Goal? {
        return goals.first(where: { $0.id == goalId })
    }
    
    func updateGoalProgress(goalId: Int, reductionValue: Double) {
        guard let index = goals.firstIndex(where: { $0.id == goalId }) else {
            print("There is no goal associated with this goal ID!")
            return
        }

        guard goals[index].targetLeft >= reductionValue else {
            handleExceededReductionLimit(goalIndex: index, reductionValue: reductionValue)
            return
        }
        
        goals[index].updateProgress(with: reductionValue)
        CarbonFootprintData.shared.reduceTotalFootprint(with: reductionValue)
    }

    func handleExceededReductionLimit(goalIndex: Int, reductionValue: Double) {
        goals[goalIndex].updateProgress(with: goals[goalIndex].targetEmissionReduction)
        CarbonFootprintData.shared.reduceTotalFootprint(with: reductionValue)
    }


    
    func checkForActiveGoals() -> Bool {
        return !goals.isEmpty
    }
    
    func displayExplicitGoal(goal: Goal) {
        print("(Goal ID: \(goal.id), Type: \(goal.type), Progress: \(goal.progress)%, Target Emission Reduction: \(goal.targetEmissionReduction), Description: \(goal.description), Target Left: \(goal.targetLeft))")
    }
    
    private func getGoalId() -> Int {
        let currentId = nextGoalId
        nextGoalId += 1
        return currentId
    }
}
