//
//  AppDelegate.swift
//  Liq
//
//  Created by Chidi Emeh on 2/13/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//access_key=MDoxZGM4YzEyNC0wZGJmLTExZTgtOWY5OC0xMzBmNThhZGUyNWM6bFIyRERBRnJkYzBKQW4zcjhsYWZDdUQ4RG00VWh5SmdkMUJK
// MDpkY2JlNzk4Mi0xMTU5LTExZTgtYTFhYy1iNzBmYWI2ZmMzOGQ6QTkydVQ3YXhWcWFmZGRDQTVFZ0xaZGxhRVRoeFJNUHA3dEFs
// MDplMWNhOGUyMC0xMTU5LTExZTgtOTE2Yy1hYjliODk2ODY1ZjE6bTFHUGllT2taenY4RlN6MDV3ZkFhYTlYRlZ4QWF0YVZwdUVz
// MDplNzUyZjc2YS0xMTU5LTExZTgtODg1MS04YjI3OWNhN2MxMWM6NHlLVGc1MWRNdFBrOWNBcmxlcHBHYWNLdWVzNnl6RlZtTmI4
    
    
//     "http://lcboapi.com/products?access_key=MDplNzUyZjc2YS0xMTU5LTExZTgtODg1MS04YjI3OWNhN2MxMWM6NHlLVGc1MWRNdFBrOWNBcmxlcHBHYWNLdWVzNnl6RlZtTmI4?page=1?per_page=150"
    
   // https://ACCESS_KEY:MDo0OTA5MjJiMC0xMzhkLTExZTgtOGM4Mi05M2I5OWRkNWFkYzk6VjBEMUNrNXBzZVl4VWp0aHVzMDNhVUpVaGZyRlNYbkdndVN6@lcboapi.com/products?page=1?per_page=150
    
//MDo0OTA5MjJiMC0xMzhkLTExZTgtOGM4Mi05M2I5OWRkNWFkYzk6VjBEMUNrNXBzZVl4VWp0aHVzMDNhVUpVaGZyRlNYbkdndVN6
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
            let urlString = "https://ACCESS_KEY:MDo0OTA5MjJiMC0xMzhkLTExZTgtOGM4Mi05M2I5OWRkNWFkYzk6VjBEMUNrNXBzZVl4VWp0aHVzMDNhVUpVaGZyRlNYbkdndVN6@lcboapi.com/products?page=1?per_page=10"
        
            let url = URL(string: urlString)
            let service = NetworkProcessor(url: url!)
        
        service.downloadJSONFromURL { (result) in
            guard let drinksrep = result  as? DrinkResponse else { return }
            let result = drinksrep.result
            print("Result = \(result.count)")
            // print("Result = \(drinksrep)")
            
            do{
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(drinksrep)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print(jsonString!)
            }catch {
                fatalError("Error encoding")
            }

        }

        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Liq")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

