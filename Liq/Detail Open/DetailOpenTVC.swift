//
//  DetailOpenTVC.swift
//  Liq
//
//  Created by Chidi Emeh on 2/26/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DetailOpenTVC: UITableViewController {

    
    
    var drink : Drink? {
        didSet {
            print("Drink was set")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}



//Register cell Nibs
extension DetailOpenTVC {
    
    func registerNibs(){
        
        tableView.register(UINib(nibName: "DescriptionTVCell", bundle: nil), forCellReuseIdentifier: Cell.descriptionTVCell.rawValue)
        tableView.register(UINib(nibName: "TastingNoteTVCell", bundle: nil), forCellReuseIdentifier: Cell.tastingNoteTVCell.rawValue)
        tableView.register(UINib(nibName: "ServingSuggestionTVCell", bundle: nil), forCellReuseIdentifier: Cell.servingSuggestionTVCell.rawValue)
        
    }
    
}


// MARK: - DATA SOURCE
extension DetailOpenTVC  {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let customHeight = CGFloat(304)
        
        switch indexPath.row {
        case 0:
            return 304
        case 1:
            return 165
        case 2:
            return 61
        case 3:
            return 61
        case 4:
            return 61
        case 5:
            return 61
        case 6:
            return 165
        case 7:
            return 175
        case 8:
            return 81
        default:
            break
        }
        
        return customHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.drinkImageTVCell.rawValue, for: indexPath) as! DrinkImageTVCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.descriptionTVCell.rawValue, for: indexPath) as! DescriptionTVCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.tastingNoteTVCell.rawValue, for: indexPath) as! TastingNoteTVCell
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.servingSuggestionTVCell.rawValue, for: indexPath) as! ServingSuggestionTVCell
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.saveDrinkTVCell.rawValue, for: indexPath) as! SaveDrinkTVCell
            return cell
        default:
            break
        }
        
        return cell
    }
}













