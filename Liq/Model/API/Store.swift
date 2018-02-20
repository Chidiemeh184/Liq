//
//  Store.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


struct Store : Codable {
    
    var id : Int
    var isDead : Bool
    var name : String?
    var tags : String?
    var addressLine1 : String?
    var addressLine2 : String?
    var city : String?
    var postalCode : String?
    var telephone : String?
    var fax : String?
    var latitude : Double?
    var longitude : Double?
    var productsCount : Int?
    var inventoryCount : Int?
    var inventoryPriceInCents : Int32?
    var inventoryVolumeInMilliliters : Int32?
    var hasWheelchairAccessibility : Bool
    var hasBilingualServices : Bool
    var hasProductConsultant : Bool
    var hasTastingBar : Bool
    var hasBeerColdRoom : Bool
    var hasSpecialOccasionPermits : Bool
    var hasVintagesCorner : Bool
    var hasParking : Bool
    var hasTransitAccess : Bool
    var sundayOpen : Int?
    var sundayClose : Int?
    var mondayOpen : Int?
    var mondayClose : Int?
    var tuesdayOpen : Int?
    var tuesdayClose : Int?
    var wednesdayOpen : Int?
    var wednesdayClose : Int?
    var thursdayOpen : Int?
    var thursdayClose : Int?
    var fridayOpen : Int?
    var fridayClose : Int?
    var saturdayOpen : Int?
    var saturdayClose : Int?
    var updatedAt : String
    var storeNo : Int?
    
    
    private enum CodingKeys : String, CodingKey {
        case id
        case isDead = "is_dead"
        case name
        case tags
        case addressLine1 = "address_line_1"
        case addressLine2 = "address_line_2"
        case city
        case postalCode = "postal_code"
        case telephone
        case fax
        case latitude
        case longitude
        case productsCount = "products_count"
        case inventoryCount = "inventory_count"
        case inventoryPriceInCents = "inventory_price_in_cents"
        case inventoryVolumeInMilliliters = "inventory_volume_in_milliliters"
        case hasWheelchairAccessibility = "has_wheelchair_accessibility"
        case hasBilingualServices = "has_bilingual_services"
        case hasProductConsultant = "has_product_consultant"
        case hasTastingBar = "has_tasting_bar"
        case hasBeerColdRoom = "has_beer_cold_room"
        case hasSpecialOccasionPermits = "has_special_occasion_permits"
        case hasVintagesCorner = "has_vintages_corner"
        case hasParking = "has_parking"
        case hasTransitAccess = "has_transit_access"
        case sundayOpen = "sunday_open"
        case sundayClose = "sunday_close"
        case mondayOpen = "monday_open"
        case mondayClose = "monday_close"
        case tuesdayOpen = "tuesday_open"
        case tuesdayClose = "tuesday_close"
        case wednesdayOpen = "wednesday_open"
        case wednesdayClose = "wednesday_close"
        case thursdayOpen = "thursday_open"
        case thursdayClose = "thursday_close"
        case fridayOpen = "friday_open"
        case fridayClose = "friday_close"
        case saturdayOpen = "saturday_open"
        case saturdayClose = "saturday_close"
        case updatedAt = "updated_at"
        case storeNo = "store_no"
        
    }
    
}







