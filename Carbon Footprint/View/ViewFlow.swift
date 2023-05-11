//
//  ViewFlow.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

struct ViewFlow {
    
    let loginController = LoginController()
    let homeController = HomeController()
    let initialConsoleView = InitialConsoleView()
    
    func run() {
//        loginController.loginUser()
        initialConsoleView.showHomeFeed()
        homeController.getUserInput()
        
    }
    
}
