//
//  FavTVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FavTVC: UITableViewController {

    @IBOutlet weak var listContainerView: UIView!
    @IBOutlet weak var gridContainerView: UIView!
    
    var drinks = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listContainerView.isHidden = false
        gridContainerView.isHidden = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
    }
    
    
    @IBAction func listButtonTapped(_ sender: UIButton) {
        listContainerView.isHidden = false
        gridContainerView.isHidden = true
    }
    
    @IBAction func gridButtonTapped(_ sender: UIButton) {
        listContainerView.isHidden = true
        gridContainerView.isHidden = false
    }
    
    @IBAction func fetchDrinks(_ sender: UIRefreshControl) {
        refreshControl?.beginRefreshing()
        
        loadData()
//
//        let storyboard = UIStoryboard(name: "Favorites", bundle: Bundle.main)
//        let listVC = storyboard.instantiateViewController(withIdentifier: "ListVC") as! ListVC
//        listVC.refreshedDrinks = drinks
//        listVC.loadFreshDrinks()
//        refreshControl?.endRefreshing()
    }
    
    
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
