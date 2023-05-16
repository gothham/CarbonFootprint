//
//  LogicView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

struct LogicView {
    
    func promptForUsername() -> String? {
        print("Enter the username -")
        return readLine()
    }
    
    func promptPassword() -> String? {
        print("Enter the password -")
        return readLine()
    }
    
    func showSuccessMessage(message: String) {
        print(message)
    }
    
    func displayInputErrorMessage() {
        print("Invalid username or password! Please try again.")
    }
    
    func promptCreateUser() -> String? {
        print("Enter username -")
        return readLine()
    }
    
    func promptCreatePassword() -> String? {
        print("Enter password -")
        return readLine()
    }
    
    func showErrorMessage(message: String) {
        print("[Error 👾! \(message)")
    }
    
}
