//
//  ListVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ListVCell: UITableViewCell {

    //UI Properties
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alcoholContentLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var varietalLabel: UILabel!
    
    //Class Property
    var drink : Drink?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func setUpWithDrink(drink : Drink){
        self.drink = drink
        drinkImageView.downloadImagefromUrl(url: drink.imageUrl)
        nameLabel.text = drink.name!
        alcoholContentLabel.text = "\(drink.alcoholContent!/100)% Vol Alc"
        styleLabel.text = drink.style!
        varietalLabel.text = drink.varietal!
    }
    
    private func setUpViews(){
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.cornerRadius = 4
    }

}
