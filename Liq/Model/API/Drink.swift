//
//  Drink.swift
//  Liq
//
//  Created by Chidi Emeh on 2/14/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


struct Drink : Codable {
    var id : Int?
    var isDead : Bool?
    var name : String?
    var tags : String?
    var isDiscontinued : Bool?
    var priceInCents : Int?
    var regularPriceInCents : Int?
    var limitedTimeOfferSavingsInCents : Int?
    var limitedTimeOfferEndsOn : String?   // n/a
    var bonusRewardMiles : Int?
    var bonusRewardMilesEndsOn : Int?           // n/a
    var stockType : String?
    var primaryCategory : String?
    var secondaryCategory : String?
    var origin : String?
    var package : String?
    var packageUnitType : String?
    var packageUnitVolumeInMilliliters : Int?
    var totalPackageUnits : Int?
    var volumeInMilliliters : Int?
    var alcoholContent : Int?
    var pricePerLiterOfAlcoholInCents : Int?
    var pricePerLiterInCents : Int?
    var inventoryCount : Int?
    var inventoryVolumeInMilliliters : Int?
    var inventoryPriceInCents : Int?
    var sugarContent : String?             // n/a
    var producerName : String?
    var releasedOn : String?
    var hasValueAddedPromotion : Bool?
    var hasLimitedTimeOffer : Bool?
    var hasBonusRewardMiles : Bool?
    var isSeasonal : Bool?
    var isVqa : Bool?
    var isOcb : Bool?
    var isKosher : Bool?
    var valueAddedPromotionDescription : String?   // n/a
    var description : String?       // n/a
    var servingSuggestion : String?
    var tastingNote : String?
    var updatedAt : String?
    
    var imageThumbUrl : URL?
    var imageUrl : URL?
    var varietal : String?
    var style : String?
    var tertiaryCategory : String?
    var sugarInGramsPerLiter : Int?      // n/a
    var clearanceSaleSavingsInCents : Int?
    var hasClearanceSale : Bool?
    var productNo : Int?

    
    
    private enum CodingKeys : String, CodingKey {
        case id
        case isDead = "is_dead"
        case name
        case tags
        case isDiscontinued = "is_Discontinued"
        case priceInCents = "price_in_cents"
        case regularPriceInCents = "regular_price_in_cents"
        case limitedTimeOfferSavingsInCents = "limited_time_offer_savings_in_cents"
        case limitedTimeOfferEndsOn = "limited_time_offer_ends_on"
        case bonusRewardMiles = "bonus_reward_miles"
        case bonusRewardMilesEndsOn = "bonus_reward_miles_ends_on"
        case stockType = "stock_type"
        case primaryCategory = "primary_category"
        case secondaryCategory = "secondary_category"
        case origin
        case package
        case packageUnitType = "package_unit_type"
        case packageUnitVolumeInMilliliters = "package_unit_volume_in_milliliters"
        case totalPackageUnits = "total_package_units"
        case volumeInMilliliters = "volume_in_milliliters"
        case alcoholContent = "alcohol_content"
        case pricePerLiterOfAlcoholInCents = "price_per_liter_of_alcohol_in_cents"
        case pricePerLiterInCents = "price_per_liter_in_cents"
        case inventoryCount = "inventory_count"
        case inventoryVolumeInMilliliters = "inventory_volume_in_milliliters"
        case inventoryPriceInCents = "inventory_price_in_cents"
        case sugarContent = "sugar_content"
        case producerName = "producer_name"
        case releasedOn = "released_on"
        case hasValueAddedPromotion = "has_value_added_promotion"
        case hasLimitedTimeOffer = "has_limited_time_offer"
        case hasBonusRewardMiles = "has_bonus_reward_miles"
        case isSeasonal = "is_seasonal"
        case isVqa = "is_vqa"
        case isOcb = "is_ocb"
        case isKosher = "is_kosher"
        case valueAddedPromotionDescription = "value_added_promotion_description"
        case description
        case servingSuggestion = "serving_suggestion"
        case tastingNote = "tasting_note"
        case updatedAt = "updated_at"
        
        case imageThumbUrl = "image_thumb_url"
        case imageUrl = "image_url"
        case varietal
        case style
        case tertiaryCategory = "tertiary_category"
        case sugarInGramsPerLiter = "sugar_in_grams_per_liter"
        case clearanceSaleSavingsInCents = "clearance_sale_savings_in_cents"
        case hasClearanceSale = "has_clearance_sale"
        case productNo = "product_no"
 
        
    }
    
    
    
}//End Struct Drinks


















