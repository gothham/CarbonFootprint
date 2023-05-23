//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CFCalculatorView {
    
    func showCategory() {
        
        print()
        print("-    Carbon footprint calculator")
        print("--------------------------------------")
        /*print("1. Calculate transportion footprint.")
         print("2. Calculate diet footprint.")
         print("3. Show all footprint.")*/
        print("Select an activity type:")
        print("1. Transportation")
        print("2. Diet")
        print("3. Electricity")
        print("4. Household")
        print("5. Other")
        print("6. Display footprints.")
        print("0. Go back")
        //        print("Please select an option (Number)")
        print("--------------------------------------")
        
        /*if let userInput = readLine(), let userChoice = Int(userInput), let option = CalculatorCategoryOption(rawValue: userChoice) {
            CFCalculatorController.shared.handleUserInput(option: option)
        } else {
            print("Invalid option! Please try again.")
            showCategory()
        }*/
        if let userInput = readLine(), let userChoice = Int(userInput), let option = ActivityTypeOption(rawValue: userChoice) {
            CFCalculatorController.shared.handleUserInputForType(option: option)
        } else {
            print("Invalid option! Please try again.")
            showCategory()
        }
    }
    
}
