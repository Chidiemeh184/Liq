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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpViews(){
        
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.cornerRadius = 4
        
        
    }

}
