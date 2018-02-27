//
//  TastingNoteTVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/26/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TastingNoteTVCell: UITableViewCell {

    
    @IBOutlet weak var tastingNoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(note : String){
        tastingNoteLabel.text = note
    }

    
}
