//
//  ToggleButton.swift
//  Liq
//
//  Created by Chidi Emeh on 3/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ToggleButton: UIButton {

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.LiqBlack.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.twitterBlue, for: .normal)
        addTarget(self, action: #selector(SAFollowButton.buttonPressed), for: .touchUpInside)
    }
    
    func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? Colors.LiqBlack : .clear
        //let title = bool ? "Following" : "Follow"
        let titleColor = bool ? .white : Colors.LiqBlack
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }

}
