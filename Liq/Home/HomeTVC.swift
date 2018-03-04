//
//  HomeTVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HomeTVC: UITableViewController {

    var refresher : UIRefreshControl!
    @IBOutlet weak var drinkTypeSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var freshContainerView: UIView!
    @IBOutlet weak var seenContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        freshContainerView.isHidden = false
        seenContainerView.isHidden = true
    
        
    }

    
    @IBAction func segmentControlSwitched(_ sender: UISegmentedControl) {
        
        switch drinkTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            freshContainerView.isHidden = false
            seenContainerView.isHidden = true
        case 1:
            freshContainerView.isHidden = true
            seenContainerView.isHidden = false
        default:
            break
        }
    }
    
 
    
    
   @IBAction func fetchNewBeer(){
        refreshControl?.beginRefreshing()
        let notificationPostName = Notification.Name(NotificationKey.reloadFreshHomeDrinks.rawValue)
        NotificationCenter.default.post(name: notificationPostName, object: nil)
        refreshControl?.endRefreshing()
    }


}




// MARK: - DATA SOURCE
extension HomeTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Cell.homeTVCell.rawValue, for: indexPath) as! HomeTVCell
         return cell
     }
}
