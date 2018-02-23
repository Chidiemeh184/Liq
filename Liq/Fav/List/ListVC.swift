//
//  ListVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

protocol willRefreshDelegate {
    func loadFreshDrinks()
}

class ListVC: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    
    var refreshDelegate : willRefreshDelegate?
    
    var drinks : [Drink]?
    var refreshedDrinks : [Drink]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.delegate = self
        loadData()
    }
    


}

//MARK: - INSERT DATA
extension ListVC {
    
    func loadFreshDrinks(){
        
        
        //Need to use notification
        print("Load Fresh start")
       

        let added = refreshedDrinks![4]
        self.drinks?.append(added)
        let count = (self.refreshedDrinks?.count)!
        let indexx = IndexPath(row: count - 1, section: 0)


        
        listTableView.beginUpdates()
        listTableView.insertRows(at: [indexx], with: .none)
        listTableView.endUpdates()
    
        print("Load Fresh drink end")
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
        return 151
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
    
}


