//
//  DinkImageTableViewCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/26/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DrinkImageTVCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var varietalLabel: UILabel!
    @IBOutlet weak var pricePerLiterLabel: UILabel!
    @IBOutlet weak var volumeInMillilitersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setUp(drink : Drink){
        drinkImageView.downloadImagefromUrl(url: drink.imageUrl )
        nameLabel.text = drink.name
        varietalLabel.text = drink.varietal
        pricePerLiterLabel.text = "$\(drink.pricePerLiterInCents!/100)"
        volumeInMillilitersLabel.text = "\(drink.volumeInMilliliters!) ml"
        
    }
    

}
