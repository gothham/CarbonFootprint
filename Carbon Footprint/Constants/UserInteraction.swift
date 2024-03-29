//
//  UserInteraction.swift
//  Carbon Footprint
//  
//  Created by doss-zstch1212 on 17/05/23.
/// Use this class for dealing with the user interactions across the project.

import Foundation

class UserInteraction {
    
    // MARK: Generic method
    func promptValue<T>() -> T? {
        print("Enter the value -")
        guard let input = readLine() else { return nil } // unwrapping option string (readLine())
        
        if let value = input as? T { // converting to any type
            return value // success
        } else {
            return nil // fail
        }
    }
    
    // Write the functions that are gonna be used across the project.
    
    func promptMessage(message: String) -> String? {
        print(message)
        return readLine()
    }
    
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
}
