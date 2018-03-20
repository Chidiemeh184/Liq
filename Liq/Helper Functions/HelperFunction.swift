//
//  HelperFunction.swift
//  Liq
//
//  Created by Chidi Emeh on 3/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


class HelperFunction {
    
    
    
    static func assignMOCValuesToDrink(cDrink : CDrink, drink : Drink) -> CDrink {
        
        cDrink.alcoholContent = (drink.alcoholContent != nil) ? Int16(drink.alcoholContent!) : Int16(0)
        cDrink.bonusRewardMiles = (drink.bonusRewardMiles != nil) ? Int16(drink.bonusRewardMiles!) : Int16(0)
        cDrink.bonusRewardMilesEndsOn = (drink.bonusRewardMilesEndsOn != nil) ? Int16(drink.bonusRewardMilesEndsOn!) : Int16(0)
        
        return cDrink
    }
    
    
}
