//
//  CalculatorView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

struct CFCalculatorView {
    
//    let cfCalculatorController = CFCalculatorController()
    
    func showCategory() {
//        let cfCalculatorController = CFCalculatorController()
        print("Carbon footprint calculator")
        print("1. Calculate transportion footprint.")
        print("2. Calculate diet footprint.")
        print("3. Show all footprint.")
        print("0. Go back")
        print("Please select an option (Number)")
        
        if let userInput = readLine(), let userChoice = Int(userInput), let option = CalculatorCategoryOption(rawValue: userChoice) {
            CFCalculatorController.shared.handleUserInput(option: option)
//            cfCalculatorController.handleUserInput(option: option)
        } else {
            print("Invalid option! Please try again.")
            showCategory()
        }
    }
    
}