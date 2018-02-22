//
//  GridCVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class GridCVCell: UICollectionViewCell {
    
    @IBOutlet weak var cancelButtonImageview: UIImageView!
    @IBOutlet weak var drinkImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alcoholContentLabel: UILabel!
    
    //Class Property
    var drink : Drink?
    
    override func awakeFromNib() {
        self.makeDropShadow()
        cancelButtonImageview.isHidden = true
    }
    
    
    func setUpWithDrink(drink : Drink){
        
        self.drink = drink
        drinkImageview.downloadImagefromUrl(url: drink.imageUrl)
        nameLabel.text = drink.name!
        alcoholContentLabel.text = "\(drink.alcoholContent!/100)% Vol Alc"
    }
    
    
    
}
