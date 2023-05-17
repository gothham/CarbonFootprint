//
//  CFCalculatorController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 17/05/23.
//

import Foundation

class CFCalculatorController {
    
    func handleUserInput(option: CalculatorCategoryOption) {
        let cfCalculatorView = CalculatorView()
        switch option {
        case .transportation:
            cfCalculatorView.showTransportView()
        case .diet:
            print("Diet case excuted")
        }
    }
    
}
