//
//  CredentialController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 12/05/23.
//

import Foundation

class CredentialController {
    
    static let shared = CredentialController()
    
    var isLoggedIn:Bool = false
    
    private var loggedInUser: User?
    
    var credentials: [String: String] = ["Admin": "noobMaster69", "SuperAdmin": "proMaster69","q": "q"]
    
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
    
    // TODO: Change password
    func changePassword(user: User) {
        
    }
    
    func prepareLogOut() {
        isLoggedIn = false
    }
    
    // TODO: Check for duplicates or user already exists
    func existingUser(user: User) -> Bool{
        /*if verifyCredentials(verifyUser: user) {
            return true
        } else {
            print("New user")
            return false
        }*/
        
        return credentials[user.username] != nil
    }
}
