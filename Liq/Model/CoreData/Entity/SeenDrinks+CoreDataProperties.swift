//
//  SeenDrinks+CoreDataProperties.swift
//  Liq
//
//  Created by Chidi Emeh on 3/8/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//
//

import Foundation
import CoreData


extension SeenDrinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeenDrinks> {
        return NSFetchRequest<SeenDrinks>(entityName: "SeenDrinks")
    }

    @NSManaged public var drinks: NSSet?

}

// MARK: Generated accessors for drinks
extension SeenDrinks {

    @objc(addDrinksObject:)
    @NSManaged public func addToDrinks(_ value: CDrink)

    @objc(removeDrinksObject:)
    @NSManaged public func removeFromDrinks(_ value: CDrink)

    @objc(addDrinks:)
    @NSManaged public func addToDrinks(_ values: NSSet)

    @objc(removeDrinks:)
    @NSManaged public func removeFromDrinks(_ values: NSSet)

}
