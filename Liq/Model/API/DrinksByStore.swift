//
//  DrinksByStore.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation

struct DrinksByStore : Codable {
    
    var status : Int
    var message : String?
    var pager : Pager?
    var result : [Drink]?
    var store : Store?
    var suggestion : String?
    
}
