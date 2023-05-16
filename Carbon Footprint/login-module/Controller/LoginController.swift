//
//  LoginController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

class LoginController {
    
    let credentialController = CredentialController()
    
    func loginUser() {
        
        let logicView = LogicView()
        
        while !credentialController.isLoggedIn {
//            print(credentialController.getAllCredentials())
            if let username = logicView.promptForUsername(),
               let password = logicView.promptPassword() {
                let user = User(username: username, password: password)
                if credentialController.verifyCredentials(verifyUser: user) {
                    logicView.showSuccessMessage(message: "Logged in successfully!")
                    credentialController.isLoggedIn = true
                    credentialController.setUserLoggedIn(user: user)
                } else {
                    logicView.displayInputErrorMessage()
                }
                
            }
        }
    }
    
    func createUser() {
        
        let logicView = LogicView()
        
        if let username = logicView.promptCreateUser(),
           let password = logicView.promptCreatePassword() {
            let newUser = User(username: username, password: password)
            if !credentialController.existingUser(user: newUser) {
                credentialController.addCredentials(newUser)
                logicView.showSuccessMessage(message: "User created successfully.\nSign In")
                loginUser()
            } else {
                print("User already exists")
            }
        } else {
            logicView.showErrorMessage(message: "Failed to create user.")
        }
        
    }
}

extension LoginController {
    
    func displayLoginMenu() {
        print("1. Create account.")
        print("2. Already have an account? Login now.")
        
        // accepting user input
        if let userInput = readLine(),
         let selectedOption = Int(userInput),
            let option = LoginOption(rawValue: selectedOption) {
            handleLoginOption(selectedOption: option)
            } else {
                print("[Error message 👾!] Invalid input.")
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
