//
//  CredentialController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 12/05/23.
//

import Foundation

struct CredentialController {
    
    var isLoggedIn: Bool = false
    
    var credentials: [String: String] = ["admin": "notAdmin69"]
    
    mutating func addCredentials(_ credentials: User) {
        self.credentials[credentials.username] = credentials.password
    }
    
    func getPassword(username: String) -> String?{
        return credentials[username]
    }
    
    func getAllCredentials() -> [User] {
        
        var allCredentials: [User] = []
        
        for (username, password) in credentials {
            let credential = User(username: username, password: password)
            allCredentials.append(credential)
        }
        
        return allCredentials
        
    }
    
    
}
