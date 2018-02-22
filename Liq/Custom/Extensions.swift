//
//  Extensions.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import UIKit



extension UICollectionViewCell {
    
    func makeDropShadow(){
        
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor

        //        self.contentView.layer.masksToBounds = false  //w: 184 h : 160
//        self.contentView.clipsToBounds = false
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowRadius = 1
//        self.layer.shadowOpacity = 0.9
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
    
}


extension UIImageView {
    
    func downloadImagefromUrl(url : URL?){
        
        var downloadeImage = UIImage()
        
        guard let imageURL = url else {return}
        let imageProcessor = NetworkProcessor(url: imageURL)
        
        imageProcessor.downloadImageDataFromURL { (data, response, error) in
            DispatchQueue.main.async {
                guard let imageData = data else { return }
                downloadeImage = UIImage(data: imageData)!
                self.image = downloadeImage
            }
        }
        
        
    }
}







