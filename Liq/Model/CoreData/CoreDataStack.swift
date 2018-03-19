//
//  CoreDataStack.swift
//  Liq
//
//  Created by Chidi Emeh on 3/5/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack {
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Liq_Store")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
}//End Class CoreDataStack
