//
//  Result.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation



struct Result : Codable {
    
    var productId : Int?
    var storeId : Int?
    var isDead : Bool?
    var quantity : Int?
    var updatedOn : String?
    var updatedAt : String?
    var productNo : Int?
    var storeNo : Int?

    
    private enum CodingKeys : String, CodingKey {
        
        case productId = "product_id"
        case storeId = "store_id"
        case isDead = "is_dead"
        case quantity
        case updatedOn = "updated_on"
        case updatedAt = "updated_at"
        case productNo = "product_no"
        case storeNo = "store_no"

    }
 
}
