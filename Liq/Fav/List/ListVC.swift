//
//  ListVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit


class ListVC: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    
    var drinks : [Drink]?
    var refreshedDrinks : [Drink]?
    let observeDrinksNotificationName = Notification.Name(NotificationKey.reloadFreshDrinks.rawValue)
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.delegate = self
        loadData()
        createObservers()
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadFreshDrinks), name: observeDrinksNotificationName, object: nil)
    }


}

//MARK: - INSERT DATA
extension ListVC {
    
    @objc func loadFreshDrinks(){
        
        loadRefreshData()
        let freshDrinksToAdd = refreshedDrinks![0..<6]
        var positionCount = 0
        var newIndices = [IndexPath]()
        
        for drink in freshDrinksToAdd {
            drinks?.append(drink)
            let indexOfNewDrink = IndexPath(row: positionCount - 1 , section: 0)
            newIndices.append(indexOfNewDrink)
            positionCount = positionCount + 1
        }
        
        listTableView.performBatchUpdates({
            listTableView.insertRows(at: newIndices, with: .middle)
        })
    }

}

//MARK: - DELETE ROW
extension ListVC {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            drinks?.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .none)
            tableView.endUpdates()
        }
    }
}


// MARK: - DATA SOURCE
extension ListVC  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let customHeight = CGFloat(151)
        return customHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (drinks?.count)! 
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listVCell.rawValue, for: indexPath) as! ListVCell
        cell.setUpWithDrink(drink: drinks![indexPath.row])
        return cell
    }
}



//MARK: - LOAD DATA
extension ListVC {
   
    func loadData() {
        let filePath = Bundle.main.path(forResource: "store217", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let storeJSONData = try JSONDecoder().decode(DrinksByStore.self, from: data)
            guard let drinks = storeJSONData.result else { return }
            
            self.drinks = drinks
            //print("Drinks loaded : \(drinks.count)")
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


