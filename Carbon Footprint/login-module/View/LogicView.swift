//
//  LogicView.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//

import Foundation

struct LogicView {
    
    func promptMessage(message: String) -> String? {
        print(message)
        return readLine()
    }
    
    func showSuccessMessage(message: String) {
        print(message)
    }
    
    func displayInputErrorMessage() {
        print("Invalid username or password! Please try again.")
    }
    
    
    func showErrorMessage(message: String) {
        print("[Error 👾! \(message)")
    }
    
}
