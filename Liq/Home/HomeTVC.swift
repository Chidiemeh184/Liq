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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        refresher = UIRefreshControl()
//        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        refresher.addTarget(self, action: #selector(HomeTVC.fetchNewBeer), for: .valueChanged)
//        tableView.addSubview(refresher)
        
    }

   @IBAction func fetchNewBeer(){
    
        refreshControl?.beginRefreshing()
        print("Fetching Fresh Beer....")
        refreshControl?.endRefreshing()
    }


}







// MARK: - HEIGHT
extension HomeTVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 234
    }
}



// MARK: - DATA SOURCE
extension HomeTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Cell.homeTVCell.rawValue, for: indexPath) as! HomeTVCell

         return cell
     }
}
