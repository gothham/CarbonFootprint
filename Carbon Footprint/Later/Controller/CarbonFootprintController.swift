//
//  CarbonFootprintController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class CarbonFootprintController {
    
    let carbonFootprintModel = CFCarbonFootprinCalcModel()
    let calculatorController = CFCalculatorController()
    let cfCalcualtorView = CalculatorView()
    let loginController = LoginController()
    
    func handleUserInput(selectedOption option: MenuOption) {
        switch option {
        case .calculateCarbonFootprint:
//            print("Debug - inside case .calculateCarbonFootprint")
            cfCalcualtorView.showCategory()
        case .addFootprint:
            print("Debug - inside case .addFootprint")
        case .exit:
            print("Thanks for using the app :)")
            break
        case .logOut:
//            print("Debug - inside case .logOut")
            print("Thanks for using the app.")
            loginController.displayLoginMenu()
        }
    }
    
}
