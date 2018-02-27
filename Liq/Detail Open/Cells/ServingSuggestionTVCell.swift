//
//  ServingSuggestionTVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/27/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ServingSuggestionTVCell: UITableViewCell {

    
    @IBOutlet weak var servingSuggestionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(suggestion : String){
        servingSuggestionLabel.text = suggestion
    }
    
}
