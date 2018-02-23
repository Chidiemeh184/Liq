//
//  SeenCVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SeenCVCell: UICollectionViewCell {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    
    var drink : Drink?
    
    override func awakeFromNib() {
        self.makeDropShadow()
    }
    
    
    func setUpWithDrink(drink : Drink){
        
        self.drink = drink
        drinkImageView.downloadImagefromUrl(url: drink.imageUrl)
    }
    
}
