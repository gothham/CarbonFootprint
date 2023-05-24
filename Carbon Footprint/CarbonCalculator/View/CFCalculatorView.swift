//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CFCalculatorView {
    
    func displayCalculatorMenu() {
        
        print("|-------------------------------|")
        print("|  Carbon footprint calculator. |")
        print("|-------------------------------|")
        print("Select an activity type👇:")
        print("> 1. Transportation ✈️")
        print("> 2. Diet 🥗")
        print("> 3. Electricity ⚡️")
        print("> 4. Household 🏡")
        print("> 5. Other")
        print("> 6. Display footprints 👣")
        print("> 0. Go back 🔙")

        if let userInput = readLine(), let userChoice = Int(userInput), let option = ActivityTypeOption(rawValue: userChoice) {
            CFCalculatorController.shared.handleUserInputForType(option: option)
        } else {
            print("Invalid option! Please try again.")
            displayCalculatorMenu()
        }
    }
    
}
