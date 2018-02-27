//
//  DescriptionTVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/26/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DescriptionTVCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setUp(description : String){
        descriptionLabel.text = description
    }
    
    
}
