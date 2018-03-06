//
//  FiltersVC.swift
//  Liq
//
//  Created by Chidi Emeh on 3/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FiltersVC: UIViewController {

    @IBOutlet weak var priceSliderLabel: UILabel!
    @IBOutlet weak var alcoholSliderLabel: UILabel!
    @IBOutlet weak var volumeSliderLabel: UILabel!
    @IBOutlet weak var returnBatchLabel: UILabel!
    @IBOutlet weak var addFilterbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFilterbutton.layer.cornerRadius = addFilterbutton.layer.frame.height/2

    }

    @IBAction func priceSliderChanged(_ sender: UISlider) {
        let priceValue = Double(sender.value)
        priceSliderLabel.text = String(format: "$%.2f", priceValue)
    }
    
    @IBAction func alcoholSliderChanged(_ sender: UISlider) {

        let alcoholValue = Float(sender.value)
        
        alcoholSliderLabel.text = "\(String(format: "%.1f", alcoholValue))%"
    }
    
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        let volumeValue = Int(sender.value)
        volumeSliderLabel.text = "\(volumeValue)ml"
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func addFiltersButtonTapped(_ sender: UIButton) {
        //Create and send filters
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnBatchStepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        returnBatchLabel.text = "\(stepperValue)"
    }
    
    

}
