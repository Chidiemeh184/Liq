//
//  ShadowView.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import UIKit


class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpShadow()
    }
    
    
    func setUpShadow(){
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.9, height: 9.5) //11
        self.layer.shadowRadius = 10 //18
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
    }
    
}


