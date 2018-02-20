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
    

}
