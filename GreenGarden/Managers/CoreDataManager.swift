//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Mohammad Azam on 8/2/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "GreenGardenModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
           return persistentContainer.newBackgroundContext()
    }
    
    func save() throws {
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    func importData() async throws {
        
        func removeAllData() {
            
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Usertable")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            
            do {
                try viewContext.execute(deleteRequest)
            } catch {
                print(error)
            }
        }
        
        let usertableDTOs = try await Webservice().getAllUsertables(url: Constants.Urls.getAllUsertables)
        
        // remove existing data
        removeAllData()
        
        // insert vegetables in the database
        for usertableDTO in usertableDTOs {
            
            try await backgroundContext.perform {
                let usertable = Usertable(context: self.viewContext)
                usertable.id = Int32(usertableDTO.id)
                usertable.name = usertableDTO.name
                usertable.username = usertableDTO.username
                usertable.phone = usertableDTO.phone
                usertable.email = usertableDTO.email
                try self.save()
            }
        }
    }
}
