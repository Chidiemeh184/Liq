//
//  Inventories.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


struct Inventories : Codable {
    var status : Int
    var message : String?
    var pager : Pager
    var product : Drink?
    var result : [Result] 
    
}
