//
//  OffsetManager.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 19/05/23.
//

import Foundation

class OffsetManager {
    
    var carbonCredits: [CarbonCredit] = [
        CarbonCredit(quantity: 10, price: 10.0),
        CarbonCredit(quantity: 5, price: 15.0),
        CarbonCredit(quantity: 20, price: 250.25)
    ]
    
    func showAvailableCredits() {
        print("Available carbon credits.")
        print("----------------------------------")
        for (index,credit) in carbonCredits.enumerated() {
            print("|\(index). Quantity \(credit.quantity), Price $\(credit.price)")
        }
        print("----------------------------------")
    }
    
    func buyCarbonCredit(atIndex: Int, quantity: Int) {
        
        guard atIndex >= 0 && atIndex < carbonCredits.count else {
            print("Invalid index value!")
            return
        }
        
        var credit = carbonCredits[atIndex]
        
        guard quantity > 0 else {
            print("Invalid quantity input!")
            return
        }
        
        guard quantity <= credit.quantity else {
            print("Insufficient quantity!")
            return
        }
        
        let totalPrice = Double(quantity) * credit.price
        print("Buying \(quantity) carbon credits for $\(totalPrice)")
        
        // Updating the arrOfObjects...
        credit.quantity -= quantity
        carbonCredits[atIndex] = credit
        
    }
    
    func sellCarbonCredits(atIndex: Int, quantity: Int, price: Double) {
        
        guard atIndex >= 0 && atIndex < carbonCredits.count else {
            print("Invalid credit index.")
            return
        }
        
        var credit = carbonCredits[atIndex]
        
        credit.quantity += quantity
        credit.price += price
        
        carbonCredits[atIndex] = credit
        
        print("Selling \(quantity) carbon credits for $\(price)")
        
    }
}
