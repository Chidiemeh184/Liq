//
//  CDrink+CoreDataProperties.swift
//  Liq
//
//  Created by Chidi Emeh on 3/8/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//
//

import Foundation
import CoreData


extension CDrink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDrink> {
        return NSFetchRequest<CDrink>(entityName: "CDrink")
    }

    @NSManaged public var id: Int16
    @NSManaged public var isDead: Bool
    @NSManaged public var name: String?
    @NSManaged public var tags: String?
    @NSManaged public var isDiscontinued: Bool
    @NSManaged public var priceInCents: Int16
    @NSManaged public var regularPriceInCents: Int16
    @NSManaged public var limitedTimeOfferSavingsInCents: Int16
    @NSManaged public var limitedTimeOfferEndsOn: String?
    @NSManaged public var bonusRewardMiles: Int16
    @NSManaged public var bonusRewardMilesEndsOn: Int16
    @NSManaged public var stockType: String?
    @NSManaged public var primaryCategory: String?
    @NSManaged public var secondaryCategory: String?
    @NSManaged public var origin: String?
    @NSManaged public var package: String?
    @NSManaged public var packageUnitType: String?
    @NSManaged public var packageUnitVolumeInMilliliters: Int16
    @NSManaged public var totalPackageUnits: Int16
    @NSManaged public var volumeInMilliliters: Int16
    @NSManaged public var alcoholContent: Int16
    @NSManaged public var pricePerLiterOfAlcoholInCents: Int16
    @NSManaged public var pricePerLiterInCents: Int16
    @NSManaged public var inventoryCount: Int16
    @NSManaged public var inventoryVolumeInMilliliters: Int16
    @NSManaged public var inventoryPriceInCents: Int16
    @NSManaged public var sugarContent: String?
    @NSManaged public var producerName: String?
    @NSManaged public var releasedOn: String?
    @NSManaged public var hasValueAddedPromotion: Bool
    @NSManaged public var hasLimitedTimeOffer: Bool
    @NSManaged public var hasBonusRewardMiles: Bool
    @NSManaged public var isSeasonal: Bool
    @NSManaged public var isVqa: Bool
    @NSManaged public var isOcb: Bool
    @NSManaged public var isKosher: Bool
    @NSManaged public var valueAddedPromotionDescription: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var servingSuggestion: String?
    @NSManaged public var tastingNote: String?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var imageThumbUrl: URL?
    @NSManaged public var imageUrl: URL?
    @NSManaged public var varietal: String?
    @NSManaged public var style: String?
    @NSManaged public var tertiaryCategory: String?
    @NSManaged public var sugarInGramsPerLiter: Int16
    @NSManaged public var clearanceSaleSavingsInCents: Int16
    @NSManaged public var hasClearanceSale: Bool
    @NSManaged public var productNo: Int16
    @NSManaged public var fav: FavDrinks?
    @NSManaged public var fresh: FreshDrinks?
    @NSManaged public var seen: SeenDrinks?

}
