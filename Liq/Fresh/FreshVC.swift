//
//  FreshVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FreshVC: UIViewController {

    
    @IBOutlet weak var freshCollectionView: UICollectionView!
    
    //Class Properties
    var drinks : [Drink]?
    var refreshedDrinks : [Drink]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        freshCollectionView.delegate = self
        freshCollectionView.dataSource = self
        
        loadData()
        
    }



}


//MARK: - FLOW LAYOUT
extension FreshVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50 //50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 25 //14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let customWidth = collectionView.frame.size.width/2
        
        let size = CGSize(width: customWidth - 50, height: 200)  //20 260 (100, 180) //(width: customWidth - 100, height: 180)
        
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(30, 25, 0, 25)  //(30 12 0 12)
        return inset
    }
    
    
}




//MARK: - DATASOURCE
extension FreshVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (drinks?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.freshCVCell.rawValue, for: indexPath) as! FreshCVCell
        cell.setUpWithDrink(drink: drinks![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}



//MARK: - LOAD DATA
extension FreshVC {
    
    func loadData() {
        let filePath = Bundle.main.path(forResource: "store38", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            self.drinks = drinks
            // print("Drinks loaded : \(drinks.count)")
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
}

