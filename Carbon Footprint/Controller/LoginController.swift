//
//  LoginController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

class LoginController {
    
    private let validUser: User = User(username: "admin", password: "password")
    
    func loginUser() {
        
        var loggedIn: Bool = false
        let logicView = LogicView()
        
        while !loggedIn {
            if let username = logicView.promptForUsername(),
               let password = logicView.promptPassword() {
                let user = User(username: username, password: password)
                
                if user.username == validUser.username && user.password == validUser.password {
                    logicView.showSuccessMessage()
                    loggedIn = true
                } else {
                    logicView.showErrorMessage()
                }
            }
        }
    }
}
