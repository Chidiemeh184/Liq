//
//  HelperFunction.swift
//  Liq
//
//  Created by Chidi Emeh on 3/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


class HelperFunction {
    
    
    
 
    static func assignDrinkToCDrink(cDrink : CDrink, drink : Drink) -> CDrink {
        cDrink.alcoholContent = Int32((drink.alcoholContent != nil) ? Int32(drink.alcoholContent!) : Int32(0))
        cDrink.bonusRewardMiles = (drink.bonusRewardMiles != nil) ? Int32(drink.bonusRewardMiles!) : Int32(0)
        cDrink.bonusRewardMilesEndsOn = (drink.bonusRewardMilesEndsOn != nil) ? Int32(drink.bonusRewardMilesEndsOn!) : Int32(0)
        cDrink.clearanceSaleSavingsInCents =  (drink.clearanceSaleSavingsInCents != nil) ? Int32(drink.clearanceSaleSavingsInCents!) : Int32(0)
        cDrink.hasBonusRewardMiles = drink.hasBonusRewardMiles! ? true : false
        cDrink.hasClearanceSale = drink.hasClearanceSale! ? true : false
        cDrink.hasLimitedTimeOffer = drink.hasLimitedTimeOffer! ? true : false
        cDrink.hasValueAddedPromotion = drink.hasValueAddedPromotion! ? true : false
        
       cDrink.id = (drink.id != nil) ? Int32(drink.id!) : Int32(0)
        

        cDrink.imageThumbUrl = drink.imageThumbUrl
        cDrink.imageUrl = drink.imageUrl
        cDrink.inventoryCount = (drink.inventoryCount != nil) ? Int32(drink.inventoryCount!) : Int32(0)
        cDrink.inventoryPriceInCents = (drink.inventoryPriceInCents != nil) ? Int32(drink.inventoryPriceInCents!) : Int32(0)
        cDrink.inventoryVolumeInMilliliters = (drink.inventoryVolumeInMilliliters != nil) ? Int32(drink.inventoryVolumeInMilliliters!) : Int32(0)
        cDrink.isDead = (drink.isDead != nil) ? true : false
        cDrink.isDiscontinued = (drink.isDiscontinued != nil) ? true : false
        cDrink.isKosher = (drink.isKosher != nil) ? true : false
        cDrink.isOcb = (drink.isOcb != nil) ? true : false
        cDrink.isSeasonal = (drink.isSeasonal != nil) ? true : false
        cDrink.isVqa = (drink.isVqa != nil) ? true : false
        cDrink.itemDescription = drink.description
        cDrink.limitedTimeOfferEndsOn = drink.limitedTimeOfferEndsOn
        cDrink.limitedTimeOfferSavingsInCents = (drink.limitedTimeOfferSavingsInCents != nil) ? Int32(drink.limitedTimeOfferSavingsInCents!) : Int32(0)
        cDrink.name = drink.name
        cDrink.origin = drink.name
        cDrink.package = drink.package
        cDrink.packageUnitType = drink.packageUnitType
        cDrink.packageUnitVolumeInMilliliters = (drink.packageUnitVolumeInMilliliters != nil) ? Int32(drink.packageUnitVolumeInMilliliters!) : Int32(0)
        cDrink.priceInCents = (drink.priceInCents != nil) ? Int32(drink.priceInCents!) : Int32(0)
        cDrink.pricePerLiterInCents = (drink.pricePerLiterInCents != nil) ? Int32(drink.pricePerLiterInCents!) : Int32(0)
        cDrink.pricePerLiterOfAlcoholInCents = (drink.pricePerLiterOfAlcoholInCents != nil) ? Int32(drink.pricePerLiterOfAlcoholInCents!) : Int32(0)
        cDrink.primaryCategory = drink.primaryCategory
        cDrink.producerName = drink.producerName
        cDrink.productNo =  (drink.productNo != nil) ? Int32(drink.productNo!) : Int32(0)
        cDrink.regularPriceInCents =  (drink.regularPriceInCents != nil) ? Int32(drink.regularPriceInCents!) : Int32(0)
        cDrink.releasedOn = drink.releasedOn
        cDrink.secondaryCategory = drink.secondaryCategory
        cDrink.servingSuggestion = drink.servingSuggestion
        cDrink.stockType = drink.stockType
        cDrink.style = drink.style
        cDrink.sugarContent = drink.sugarContent
        cDrink.sugarInGramsPerLiter = (drink.sugarInGramsPerLiter != nil) ? Int32(drink.sugarInGramsPerLiter!) : Int32(0)
        cDrink.tags = drink.tags
        cDrink.tastingNote = drink.tastingNote
        cDrink.tertiaryCategory = drink.tertiaryCategory
        cDrink.totalPackageUnits = (drink.totalPackageUnits != nil) ? Int32(drink.totalPackageUnits!) : Int32(0)
        cDrink.updatedAt = drink.updatedAt
        cDrink.valueAddedPromotionDescription = drink.valueAddedPromotionDescription
        cDrink.varietal = drink.varietal
        cDrink.volumeInMilliliters = (drink.volumeInMilliliters != nil) ? Int32(drink.volumeInMilliliters!) : Int32(0)
        
        return cDrink
        
    }
    
    
}
