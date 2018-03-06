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
    let coredata = CoreDataStack()
//access_key=MDoxZGM4YzEyNC0wZGJmLTExZTgtOWY5OC0xMzBmNThhZGUyNWM6bFIyRERBRnJkYzBKQW4zcjhsYWZDdUQ4RG00VWh5SmdkMUJK
// MDpkY2JlNzk4Mi0xMTU5LTExZTgtYTFhYy1iNzBmYWI2ZmMzOGQ6QTkydVQ3YXhWcWFmZGRDQTVFZ0xaZGxhRVRoeFJNUHA3dEFs
// MDplMWNhOGUyMC0xMTU5LTExZTgtOTE2Yy1hYjliODk2ODY1ZjE6bTFHUGllT2taenY4RlN6MDV3ZkFhYTlYRlZ4QWF0YVZwdUVz
// MDplNzUyZjc2YS0xMTU5LTExZTgtODg1MS04YjI3OWNhN2MxMWM6NHlLVGc1MWRNdFBrOWNBcmxlcHBHYWNLdWVzNnl6RlZtTmI4
    
    
//     "http://lcboapi.com/products?access_key=MDplNzUyZjc2YS0xMTU5LTExZTgtODg1MS04YjI3OWNhN2MxMWM6NHlLVGc1MWRNdFBrOWNBcmxlcHBHYWNLdWVzNnl6RlZtTmI4?page=1?per_page=150"
    
   // https://ACCESS_KEY:MDo0OTA5MjJiMC0xMzhkLTExZTgtOGM4Mi05M2I5OWRkNWFkYzk6VjBEMUNrNXBzZVl4VWp0aHVzMDNhVUpVaGZyRlNYbkdndVN6@lcboapi.com/products?page=1?per_page=150
    
//MDo0OTA5MjJiMC0xMzhkLTExZTgtOGM4Mi05M2I5OWRkNWFkYzk6VjBEMUNrNXBzZVl4VWp0aHVzMDNhVUpVaGZyRlNYbkdndVN6
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
//            let urlString = "https://lcboapi.com/products/300681"
//
//            let url = URL(string: urlString)
//            let service = NetworkProcessor(url: url!)
//
//        service.downloadJSONFromURL { (result) in
//            guard let drinksrep = result  as? DrinkResponse else { return }
//            let result = drinksrep.result
//            //print("Result = \(result?.count)")
//            //print("Result = \(drinksrep)")
//
//            do{
//                let jsonEncoder = JSONEncoder()
//                let jsonData = try jsonEncoder.encode(drinksrep)
//                let jsonString = String(data: jsonData, encoding: .utf8)
//                print(jsonString!)
//            }catch {
//                fatalError("Error encoding")
//            }
//
//        }

   
//
//        let urlString = "https://lcboapi.com/stores/10/products?page=1?per_page=5"
//
//                let url = URL(string: urlString)
//                let service = NetworkProcessor(url: url!)
//
//        service.downloadInventoriesFromURL { (stores) in
//            guard let stores = stores as? DrinksByStore else { return }
//            let result = stores.result
//            print(result)
//                print("----*********========================================********--------")
//            
//            
//            do {
//                let jsonEncoder = JSONEncoder()
//                let invetoryData = try jsonEncoder.encode(result)
//                //let pagerData = try jsonEncoder.encode(pager)
//                let inventoryString = String(data: invetoryData, encoding: .utf8)
//                //let pagerString = String(data: pagerData, encoding: .utf8)
//                print(inventoryString)
//                print("----*********========================================********--------")
//                print(invetoryData)
//                
//            }catch {
//                fatalError("Error ending result")
//            }
//            
//        }

        
        
        
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
        self.coredata.saveContext()
    }



}

