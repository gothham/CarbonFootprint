//
//  MenuLogicView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 16/05/23.
//

import Foundation

class MenuLogicView {
    
    // MARK: - Singleton class
    
    // Singleton class
    static let shared = MenuLogicView()
    
    private init() {}
    
    // MARK: - Public methods.
    // Change the menu options here
    func displayMenuOption() {
        
        let appName = "CO\u{2082}e"
        print("|--------------------------------|")
        print("| Welcome to the \(appName) app. |    |")
        print("|--------------------------------|")
        print("> 0. Exit")
        print("> 1. Calculate carbon footprint.")
        print("> 2. Offset Carbon footprint.")
        print("> 3. Manage goals.")
        print("> 4. Offset carbon footprint.")
        print("> 5. Log out")
        print("- Please select an option.")
        getUserInput()
    }
    
    func getUserInput() {
        
        let menuController = MenuController()
        if let input = readLine(),let userInput = Int(input), let option = MenuOption(rawValue: userInput) {
            menuController.handleUserInput(selectedOption: option)
        } else {
            print("Invalid input! Please try again.")
            displayMenuOption()
        }
    }
}
