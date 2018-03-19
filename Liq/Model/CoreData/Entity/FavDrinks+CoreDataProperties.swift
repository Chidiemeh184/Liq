//
//  FavDrinks+CoreDataProperties.swift
//  Liq
//
//  Created by Chidi Emeh on 3/8/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//
//

import Foundation
import CoreData


extension FavDrinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavDrinks> {
        return NSFetchRequest<FavDrinks>(entityName: "FavDrinks")
    }

    @NSManaged public var drinks: NSSet?

}

// MARK: Generated accessors for drinks
extension FavDrinks {

    @objc(addDrinksObject:)
    @NSManaged public func addToDrinks(_ value: CDrink)

    @objc(removeDrinksObject:)
    @NSManaged public func removeFromDrinks(_ value: CDrink)

    @objc(addDrinks:)
    @NSManaged public func addToDrinks(_ values: NSSet)

    @objc(removeDrinks:)
    @NSManaged public func removeFromDrinks(_ values: NSSet)

}
