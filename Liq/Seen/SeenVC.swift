//
//  SeenVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SeenVC: UIViewController {

    
    @IBOutlet weak var seenCollectionView: UICollectionView!
    
    
    //Class Properties
    var drinks : [Drink]?
    var refreshedDrinks : [Drink]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seenCollectionView.dataSource = self
        seenCollectionView.delegate = self
        
        loadData()

    }
    
}



//MARK: - FLOW LAYOUT
extension SeenVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let lineSpaceBetweenItems = CGFloat(50)
        return lineSpaceBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let interItemSpace =  CGFloat(25)
        return interItemSpace
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let customWidth = collectionView.frame.size.width/2
        let customHeight = CGFloat(200)
        let lineSpaceBetweenItems = CGFloat(50)
        let size = CGSize(width: customWidth - lineSpaceBetweenItems, height: customHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let topSpace = 30, leftSpace = 25, rightSpace = 0, buttomSpace = 25
        let inset = UIEdgeInsetsMake(CGFloat(topSpace), CGFloat(leftSpace), CGFloat(rightSpace), CGFloat(buttomSpace))
        return inset
    }
    
}


//MARK: - DATASOURCE
extension SeenVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (drinks?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.seenCVCell.rawValue, for: indexPath) as! SeenCVCell
        cell.setUpWithDrink(drink: drinks![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segue.freshToDetailOpen.rawValue, sender: indexPath)
    }
    
    
}


//MARK: Segue

extension SeenVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.freshToDetailOpen.rawValue {
            
            let detailOpenTVC = segue.destination as! DetailOpenTVC
            guard let indexPath = sender as? NSIndexPath else { return }
            let seenCVCell = seenCollectionView.cellForItem(at: indexPath as IndexPath) as? SeenCVCell
            detailOpenTVC.drink = seenCVCell?.drink
            
        }
    }
    
}




//MARK: - LOAD DATA
extension SeenVC {
    
    func loadData() {
        let filePath = Bundle.main.path(forResource: "store38", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            self.drinks = drinks
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
}

