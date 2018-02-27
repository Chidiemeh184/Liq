//
//  InformationTVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/26/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class InformationTVCell: UITableViewCell {

    
    @IBOutlet weak var infoTypeLabel: UILabel!
    @IBOutlet weak var infoAnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(type : String, answer : String){
        infoTypeLabel.text = type
        infoAnswerLabel.text = answer
    }

}
