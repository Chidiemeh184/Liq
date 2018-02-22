//
//  GridVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class GridVC: UIViewController {

    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    //Class Properties
    var drinks : [Drink]?
    var refreshedDrinks : [Drink]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        
        loadData()
        
        //Long Press Gesture recognizer
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(GridVC.handleLongPress))
      //  lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        gridCollectionView.addGestureRecognizer(lpgr)
    
        
        
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer){
        if gesture.state != .ended {
            return
        }
        let position = gesture.location(in: gridCollectionView)
        if let indexPath = gridCollectionView.indexPathForItem(at: position){

            
            let cell = gridCollectionView.cellForItem(at: indexPath) as! GridCVCell
            cell.cancelButtonImageview.isHidden = true
            print("Position of indexPath : \(indexPath)")
            removeItemAt(indexPath: indexPath)
        
        }

    }
    
    
    func removeItemAt(indexPath : IndexPath){
        gridCollectionView.performBatchUpdates({
            //Remove item from Datasource before deleting
            gridCollectionView.deleteItems(at: [indexPath])
        }) { (finished) in
            self.gridCollectionView.reloadItems(at: self.gridCollectionView.indexPathsForVisibleItems)
        }
    }
    
    
}

//MARK: - Gesture Recognizers
extension GridVC {
    
    
    
    
}



//MARK: - FLOW LAYOUT
extension GridVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 //50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 //14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let customWidth = collectionView.frame.size.width/3
        
        let size = CGSize(width: customWidth - 10, height: 200)  //20 260 (100, 180) //(width: customWidth - 100, height: 180)
        
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(30, 5, 0, 5)  //(30 12 0 12)
        return inset
    }
    
    
}




//MARK: - DATASOURCE
extension GridVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.gridCVCell.rawValue, for: indexPath) as! GridCVCell
        cell.setUpWithDrink(drink: drinks![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}



//MARK: - LOAD DATA
extension GridVC {
    
    func loadData() {
        let filePath = Bundle.main.path(forResource: "store217", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            
            self.drinks = drinks
            print("Drinks loaded : \(drinks.count)")
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
}
