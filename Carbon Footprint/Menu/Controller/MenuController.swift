//
//  CarbonFootprintController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.
//

import Foundation

class MenuController {
    
    let carbonFootprintModel = CFCarbonFootprinCalcModel()
    let calculatorController = CFCalculatorController()
    let cfCalcualtorView = CFCalculatorView()
    let loginController = LoginController()
    
    func handleUserInput(selectedOption option: MenuOption) {
        switch option {
        case .calculateCarbonFootprint:
            cfCalcualtorView.showCategory()
        case .addFootprint:
            print("Debug - inside case .addFootprint")
        case .exit:
            print("Thanks for using the app :)")
            break
        case .logOut:
            print("Thanks for using the app. 👋")
//            print(CredentialController.shared.getAllCredentials())
            CredentialController.shared.prepareLogOut()
            loginController.displayLoginMenu()
        }
    }
    
}
