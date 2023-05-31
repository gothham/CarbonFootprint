//
//  CFOffsetView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 19/05/23.
//

import Foundation

struct CFOffsetView {
    
    let offsetController = CFOffsetController()
    
    func displayOffsetMenu() {
        print()
        print("1. Show marketplace.")
        print("2. Buy carbon credits.")
        print("3. Sell credits.")
        print("0. Go back.")
        
        // TODO: Handle user inputs
        if let userInput = readLine(), let input = Int(userInput), let selectedOption = OffsetOption(rawValue: input) {
            offsetController.handleUserInput(selectedOption: selectedOption)
        }
    }
}
