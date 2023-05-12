//
//  MenuController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class MenuController {
    
    let carbonFootprintController = CarbonFootprintController()
        
    func displayMenu() {
        
        // console UI
        print("Welcome to the Co2e app.")
        print("Please select an option.")
        print("0. Exit")
        print("1. Calculate carbon footprint.")
        print("2. Add Footprint")
        
        if let input = readLine(),let userInput = Int(input), let option = MenuOption(rawValue: userInput) {
            carbonFootprintController.handleUserInput(selectedOption: option)
        } else {
            print("Invalid input! Please try again.")
            displayMenu()
        }
    }
}
