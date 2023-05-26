//
//  LoginController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

class LoginController {
    
//    let credentialController = CredentialController()
    
    func loginUser() {
        let menuLogicView = MenuLogicView()
        let logicView = LogicView()
        
        while !CredentialController.shared.isLoggedIn {
            if let username = logicView.promptMessage(message: "> Enter the username:"),
               let password = logicView.promptMessage(message: "> Enter the password: ") {
                let user = User(username: username, password: password)
                if CredentialController.shared.verifyCredentials(verifyUser: user) {
                    logicView.showSuccessMessage(message: "[Logged in successfully!]")
                    CredentialController.shared.isLoggedIn = true
                    CredentialController.shared.setUserLoggedIn(user: user)
                    // Taking user to menu...
                    menuLogicView.displayMenuOption()
                } else {
                    logicView.displayInputErrorMessage()
                }
            }
        }
    }
    
    func createUser() {
        
        let logicView = LogicView()
        
        if let username = logicView.promptMessage(message: "> Please enter the desired account name for creation:"),
           let password = logicView.promptMessage(message: "> Please create a password for your account:") {
            let newUser = User(username: username, password: password)
            if !CredentialController.shared.existingUser(user: newUser) {
                CredentialController.shared.addCredentials(newUser)
                logicView.showSuccessMessage(message: "[User created successfully.]\n\n| SIGN IN")
                
                loginUser()
            } else {
                print("User already exists!")
                createUser()
            }
        } else {
            logicView.showErrorMessage(message: "Failed to create user!")
        }
        
    }
    
    func displayLoginMenu() {
        print("1. Create account.")
        print("2. Already have an account? Login now.")
//        print("Debug info - \(CredentialController.shared.getAllCredentials())")
        // accepting user input
        if let userInput = readLine(),
         let selectedOption = Int(userInput),
            let option = LoginOption(rawValue: selectedOption) {
            handleLoginOption(selectedOption: option)
            } else {
                print("[Error message 👾!] Invalid input.")
                displayLoginMenu()
            }
    }
    
    func handleLoginOption(selectedOption option: LoginOption) {
        
        switch option {
        case .createAccount:
            //print("Taking to create user portal 👋.")
            createUser()
        case .login:
           // print("Taking to login portal 👋.")
            loginUser()
        }
        
    }
}

