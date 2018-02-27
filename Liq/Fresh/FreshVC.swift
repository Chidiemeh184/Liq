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
    
    let observeDrinksNotificationName = Notification.Name(NotificationKey.reloadFreshHomeDrinks.rawValue)
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freshCollectionView.delegate = self
        freshCollectionView.dataSource = self
        loadData()
        createObservers()
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadFreshDrinks), name: observeDrinksNotificationName, object: nil)
    }
}


//MARK: - INSERT DATA
extension FreshVC {
    
    @objc func loadFreshDrinks(){
        
        loadRefreshData()
        let freshDrinksToAdd = refreshedDrinks![0..<6]
        var positionCount = 0
        var newIndices = [IndexPath]()
        
        for drink in freshDrinksToAdd {
            drinks?.append(drink)
            let indexOfNewDrink = IndexPath(row: positionCount , section: 0)
            newIndices.append(indexOfNewDrink)
            positionCount = positionCount + 1
        }
        
        freshCollectionView.performBatchUpdates({
            freshCollectionView.insertItems(at: newIndices)
        })
    }
}

//MARK: - FLOW LAYOUT
extension FreshVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let lineSpace = CGFloat(50)
        return lineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let interItemSpace = CGFloat(25)
        return interItemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let customWidth = collectionView.frame.size.width/2
        let customHeight = CGFloat(200)
        let itemSpace = CGFloat(50)
        let size = CGSize(width: customWidth - itemSpace, height: customHeight)
        
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let topSpace = CGFloat(30), leftSpace = CGFloat(25), bottomSpace = CGFloat(0), rightSpace = CGFloat(25)
        let inset = UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace)
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
        performSegue(withIdentifier: Segue.freshToDetailOpen.rawValue, sender: indexPath)
    }
}



//MARK: Segue

extension FreshVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.freshToDetailOpen.rawValue {
            
            let detailOpenTVC = segue.destination as! DetailOpenTVC
            guard let indexPath = sender as? NSIndexPath else { return }
            let freshCVCell = freshCollectionView.cellForItem(at: indexPath as IndexPath) as? FreshCVCell
            detailOpenTVC.drink = freshCVCell?.drink
            
        }
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
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
    
    func loadRefreshData() {
        let filePath = Bundle.main.path(forResource: "store217", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        do {
            let data = try Data(contentsOf: url)
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            self.refreshedDrinks = drinks
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
    }
    
}

