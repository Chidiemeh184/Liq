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
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(GridVC.handleLongPress))
        lpgr.delaysTouchesBegan = true
        gridCollectionView.addGestureRecognizer(lpgr)

    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer){
        if gesture.state != .ended { return }
        let position = gesture.location(in: gridCollectionView)
        if let indexPath = gridCollectionView.indexPathForItem(at: position){
            let cell = gridCollectionView.cellForItem(at: indexPath) as! GridCVCell
            cell.cancelButtonImageview.isHidden = false
        }
    }
    
    
    func removeItemAt(indexPath : IndexPath){
        drinks?.remove(at: indexPath.row)
        self.gridCollectionView.deleteItems(at: [indexPath])
        self.gridCollectionView.reloadData()
    }
    


}//End Class



//MARK: - Gesture Recognizers
extension GridVC {
    
    
    
    
}



//MARK: - FLOW LAYOUT
extension GridVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let lineSpacing = CGFloat(10)
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let interItemSpacing = CGFloat(10)
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let customWidth = collectionView.frame.size.width/3
        let customHeight = CGFloat(200)
        let lineSpace = CGFloat(10)
        let size = CGSize(width: customWidth - lineSpace, height: customHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let topSpace = CGFloat(30), leftSpace = CGFloat(5), bottomSpace = CGFloat(0), rightSpace = CGFloat(5)
        let inset = UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace)
        return inset
    }
    
}



//MARK: - DATASOURCE
extension GridVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (drinks?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.gridCVCell.rawValue, for: indexPath) as! GridCVCell
        cell.setUpWithDrink(drink: drinks![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("indexPath : \(indexPath)")
        print("row : \(indexPath.row)")
        print("section : \(indexPath.section)")

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
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
}
