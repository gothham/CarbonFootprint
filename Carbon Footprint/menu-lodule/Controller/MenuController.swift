//
//  CarbonFootprintController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 11/05/23.

import Foundation

class MenuController {
    
    let carbonFootprintModel = CFCarbonFootprinCalcModel()
    let cfCalcualtorView = CFCalculatorView()
    let loginController = LoginController()
    let offsetView = CFOffsetView()
    let goalMenuView = GoalMenuView()
//    let offsetController = CarbonOffsetFlowController()
    
    func handleUserInput(selectedOption option: MenuOption) {
        
        switch option {
        case .calculateCarbonFootprint:
            cfCalcualtorView.displayCalculatorMenu()
        case .carbonOffset:
            // TODO: Take user to the offset menu.
            offsetView.displayOffsetMenu()
        case .exit:
            print("Thanks for using the app :)")
            break
        case .logOut:
            print("Thanks for using the app. 👋")
            CredentialController.shared.prepareLogOut()
            loginController.displayLoginMenu()
        case .manageGoal:
            goalMenuView.showGoalMenu()
        case .offset:
            CarbonOffsetFlowController.shared.navigateOffsetMenuOption()
        }
    }
    
}
