//
//  HomeViewController.swift
//  Liq
//
//  Created by Chidi Emeh on 2/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var freshBeersContainerView: UIView!
    @IBOutlet weak var seenBeersContainerView: UIView!
    
    @IBOutlet weak var beerSelectorSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freshBeersContainerView.isHidden = false
        seenBeersContainerView.isHidden  = true
    }

    
    @IBAction func valueTapped(_ sender: Any) {
        switch beerSelectorSegmentedControl.selectedSegmentIndex {
        case 1:
            freshBeersContainerView.isHidden = true
            seenBeersContainerView.isHidden  = false
        case 2:
            freshBeersContainerView.isHidden = false
            seenBeersContainerView.isHidden  = true
        default:
            break
        }
    }
    
    
    @IBAction func itemSegmentSelected(_ sender: Any) {
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
