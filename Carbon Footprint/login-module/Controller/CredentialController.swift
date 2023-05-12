//
//  CredentialController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 12/05/23.
//

import Foundation

class CredentialController {
    
    var isLoggedIn:Bool = false
    
    private var loggedInUser: User?
    
    private var credentials: [String: String] = ["Admin": "noobMaster69", "SuperAdmin": "proMaster69"]
    
    func addCredentials(_ credentials: User) {
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
    
    func verifyCredentials(verifyUser user: User) -> Bool {
        
        guard let storedUser = credentials[user.username] else { return false }
        
        return storedUser == user.password
        
    }
    
    func setUserLoggedIn(user: User) {
        loggedInUser = user
    }
}
