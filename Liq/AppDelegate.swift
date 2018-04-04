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
    let coreDataStack = CoreDataStack()
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        checkDataStore()

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
        self.coreDataStack.saveContext()
    }
    
    
    
    func checkDataStore(){
        
        let request : NSFetchRequest<FavDrinks> = FavDrinks.fetchRequest()
        let moc = coreDataStack.persistentContainer.viewContext
        
        
        do {
            let favDrinkCount = try moc.count(for: request)
            if favDrinkCount == 0 {
                print("Items in FavDrink coreData = \(favDrinkCount)")
                uploadSampleFavDrinks()
                
            }else if favDrinkCount > 1 {
                print("Drinks already loaded before = \(favDrinkCount)")
            }
        }catch {
            fatalError("Error in counting home record")
        }
    }
    
    
    func uploadSampleFavDrinks(){
        let moc = coreDataStack.persistentContainer.viewContext
        let filePath = Bundle.main.path(forResource: "store217", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        do {
            let data = try Data(contentsOf: url)
            
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            
            //FavDrinks Initialization
            let favoriteDrinks = FavDrinks(context: moc)
            let favDrinkData = favoriteDrinks.drinks?.mutableCopy() as! NSMutableSet

            
            
            for drink in drinks {
                //Populate favDrinkData
                let coreDataDrink = CDrink(context: moc)
                let convertedDrink = HelperFunction.assignDrinkToCDrink(cDrink: coreDataDrink, drink: drink)
                favDrinkData.add(convertedDrink)
                
                //Add set of Drinks
                favoriteDrinks.addToDrinks(favDrinkData)
            }

                try moc.save()
            
            print("Sample Drinks loaded... Count : \(drinks.count)")
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }

    
    func uploadSampleData() {
        
//        let moc = coredata.persistentContainer.viewContext
//        
//        let filePath = Bundle.main.path(forResource: "store217", ofType: "json")
//        let url = URL(fileURLWithPath: filePath!)
//        
//        //OR Download data from remote server then populate coreData
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
//            guard let drinks = storeJSONData.result else { return }
//            
//            let favDrink = FavDrinks(context: moc)
//            
//            
//            for drink in drinks {
//                
//                let drinkToAddToFavDrinks = CDrink(context: moc)
//                
//                //Get the properties from drink and assign drinkToAddToFavDrinks
//                //Add drinkToAddToFavDrinks to the Set of drinks in favDrinks
//                //using
//                if let drinkID = drink.id {
//                    drinkToAddToFavDrinks.id = Int16(drinkID)
//                }
//               
//                
//                favDrink.addToDrinks(drinkToAddToFavDrinks)
//            }
//            
//              coredata.saveContext()
//            
//        }catch let error as NSError {
//            print("Error loading datat to coredata : \(error)")
//        }
    }


}

