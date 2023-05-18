//
//  MenuLogicView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

class MenuLogicView {
    
    // MARK: Change the menu options here
    func displayMenuOption() {
        print("Welcome to the Co2e app.")
        print("0. Exit")
        print("1. Calculate carbon footprint.")
        print("2. Add Footprint")
        print("3. Log out")
        print("Please select an option.")
        getUserInput()
    }
    
    func getUserInput() {
        let carbonFootprintController = MenuController()
        if let input = readLine(),let userInput = Int(input), let option = MenuOption(rawValue: userInput) {
            carbonFootprintController.handleUserInput(selectedOption: option)
        } else {
            print("Invalid input! Please try again.")
            displayMenuOption()
        }
    }
}
