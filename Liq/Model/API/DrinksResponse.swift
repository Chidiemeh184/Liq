//
//  DrinksResponse.swift
//  Liq
//
//  Created by Chidi Emeh on 2/14/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation

struct DrinkResponse : Codable {
    var status : Int
    var message : String?
    var result : [Drink]
}
