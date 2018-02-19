//
//  FreshCVCell.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FreshCVCell: UICollectionViewCell {
    
    @IBOutlet weak var backShadowView: ShadowView!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    override func awakeFromNib() {
       self.makeDropShadow()
    }
    
}
