//
//  DataController.swift
//  Carbon Footprint
//
//  Created by doss-zstch1212 on 10/05/23.
//  Setting up core data for the console app

import Foundation
import CoreData

class DataController {
    
    static let shared = DataController() // singleton instance
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "DataModel")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
