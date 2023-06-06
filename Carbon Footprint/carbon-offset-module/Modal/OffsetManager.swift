//
//  OffsetManager.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 19/05/23.
//

import Foundation

class OffsetManager {
    
    var profitPrice: Double = 0.0
    
    var totalCreditsSold: Int = 0
    
    var totalCreditsPurchased: Int = 0
    
    var totalAmountInvested: Double = 0.0
    
    var soldCarbonCredits: [CarbonCredit] = []
    
    var carbonCredits: [CarbonCredit] = [
        CarbonCredit(quantity: 10, price: 10.0),
        CarbonCredit(quantity: 5, price: 15.0),
        CarbonCredit(quantity: 20, price: 250.25)
    ]
    
    enum TotalValue {
        
        case sellingProfit, creditsSold, creditsPurchased, amountInvested
        
    }
    
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
    
    func showSoldCarbonCredit() {
        
        print("Sold credits:")
        for (index, credit) in soldCarbonCredits.enumerated() {
            print("\(index + 1). Quantity = \(credit.quantity), Price = \(credit.price)")
        }
        
    }
    
    func sellCarbonCredits(quantity: Int, price: Double) {
        
        let totalPrice = Double(quantity) * price
        
        let soldCarbonCredit = CarbonCredit(quantity: quantity, price: totalPrice)
        
        updateValue(value: totalPrice, for: .sellingProfit)
        updateValue(value: quantity, for: .creditsSold)
        print("Credits sold = \(totalCreditsSold), Selling profit = \(profitPrice)")
        
        soldCarbonCredits.append(soldCarbonCredit)
        
        showSoldCarbonCredit()
        
    }
    
    func updateValue<T: Numeric> (value: T, for type: TotalValue) {
        
        switch type {
            
        case .sellingProfit:
            if let value = value as? Double {
                profitPrice += value
            }
        case .creditsSold:
            if let value = value as? Int {
                totalCreditsSold += value
            }
        case .creditsPurchased:
            if let value = value as? Int {
                totalCreditsPurchased += value
            }
            
        case .amountInvested:
            if let value = value as? Double {
                totalAmountInvested += value
            }
            
        }
        
    }
    
    
}
