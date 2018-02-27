//
//  SaveDrinkTVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/27/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SaveDrinkTVCell: UITableViewCell {

    
    @IBOutlet weak var saveDrinkButton: UIButton!
    
    var drink : Drink?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      saveDrinkButton.layer.cornerRadius = saveDrinkButton.layer.frame.height/2
        
    }

    @IBAction func saveDrinkButtonTapped(_ sender: UIButton) {
        print("Drink Saved...")
    }
    
    func setUp(drink : Drink){
        self.drink = drink
    }

}
