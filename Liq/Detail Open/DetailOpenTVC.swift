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
            //print("Drink was set")
        }
    }
    
    //For custom Height
    var isDescriptionPresent = false
    var isServingSuggestionPresent = false
    var isTastingNotePresent = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        determineRowHeighsByData()
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
        let customHidingHeight = CGFloat(0)
        
        switch indexPath.row {
        case 0:
            return 304
        case 1:
            return  isDescriptionPresent ? UITableViewAutomaticDimension : customHidingHeight
        case 2:
            return 61
        case 3:
            return 61
        case 4:
            return 61
        case 5:
            return 61
        case 6:
            return 61
        case 7:
            return isTastingNotePresent ? UITableViewAutomaticDimension : customHidingHeight
        case 8:
            return isServingSuggestionPresent ? UITableViewAutomaticDimension : customHidingHeight
        case 9:
            return 81
        default:
            break
        }
        
        return customHidingHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber = 10
        return rowNumber
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.drinkImageTVCell.rawValue, for: indexPath) as! DrinkImageTVCell
            cell.setUp(drink: drink!)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.descriptionTVCell.rawValue, for: indexPath) as! DescriptionTVCell
            if let description = drink?.description {
                cell.setUp(description: description)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            let infoType = "ORIGIN"
            if let origin = drink?.origin {
                cell.setUp(type: infoType, answer: origin)
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            let infoType = "SIZE"
            if let size = drink?.volumeInMilliliters {
                cell.setUp(type: infoType, answer: "\(size) ml")
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            let infoType = "ALCOHOL"
            if let alcohol = drink?.alcoholContent {
                cell.setUp(type: infoType, answer: "\(alcohol/100) %")
            }
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            let infoType = "STYLE"
            if let style = drink?.style {
                cell.setUp(type: infoType, answer: style)
            }
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.informationTVCell.rawValue, for: indexPath) as! InformationTVCell
            let infoType = "VARIETAL"
            if let type = drink?.varietal {
                cell.setUp(type: infoType, answer: type)
            }
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.tastingNoteTVCell.rawValue, for: indexPath) as! TastingNoteTVCell
            if let note = drink?.tastingNote {
                cell.setUp(note: note)
            }
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.servingSuggestionTVCell.rawValue, for: indexPath) as! ServingSuggestionTVCell
            if let suggestion = drink?.servingSuggestion {
                cell.setUp(suggestion: suggestion)
            }
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.saveDrinkTVCell.rawValue, for: indexPath) as! SaveDrinkTVCell
            return cell
        default:
            break
        }
        
        return cell
    }
}


//Register cell Nibs
extension DetailOpenTVC {
    
    func determineRowHeighsByData(){
        if (drink?.description) != nil {
            isDescriptionPresent = true
        }
        if (drink?.servingSuggestion) != nil {
            isServingSuggestionPresent = true
        }
        if (drink?.tastingNote) != nil {
            isTastingNotePresent = true
        }
    }
    
}










