//
//  FiltersVC.swift
//  Liq
//
//  Created by Chidi Emeh on 3/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FiltersVC: UIViewController {

    //Slider Labels
    @IBOutlet weak var priceSliderLabel: UILabel!
    @IBOutlet weak var alcoholSliderLabel: UILabel!
    @IBOutlet weak var volumeSliderLabel: UILabel!
    @IBOutlet weak var returnBatchLabel: UILabel!
    @IBOutlet weak var addFilterbutton: UIButton!
    
    //Sliders
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var alcoholSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var batchStepper: UIStepper!
    
    //Filter Values
    var filterPriceValue : Double!
    var filterAlcoholValue : Float!
    var filterVolumeValue : Int!
    var filterBatchValue : Int!
    
    //Default
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFilterbutton.layer.cornerRadius = addFilterbutton.layer.frame.height/2
        loadSavedPreviousDefaultValue()
    }
    
    
    
    
    

    @IBAction func priceSliderChanged(_ sender: UISlider) {
        let priceValue = Double(sender.value)
        priceSliderLabel.text = String(format: "$%.2f", priceValue)
        filterPriceValue = priceValue
    }
    
    @IBAction func alcoholSliderChanged(_ sender: UISlider) {
        let alcoholValue = Float(sender.value)
        alcoholSliderLabel.text = "\(String(format: "%.1f", alcoholValue))%"
        filterAlcoholValue = alcoholValue
    }
    
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        let volumeValue = Int(sender.value)
        volumeSliderLabel.text = "\(volumeValue)ml"
        filterVolumeValue = volumeValue
        // defaults.set(volumeValue, forKey: FilterKeys.volume.rawValue)
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        updateFilterValues()
    }
    
    

    @IBAction func addFiltersButtonTapped(_ sender: UIButton) {
        
        //NotifyCalling object using delegates
        updateFilterValues()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnBatchStepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        returnBatchLabel.text = "\(stepperValue)"
        filterBatchValue = stepperValue
    }
    
    
    func updateFilterValues(){
        defaults.set(filterPriceValue, forKey: FilterKeys.price.rawValue)
        defaults.set(filterAlcoholValue, forKey: FilterKeys.alcohol.rawValue)
        defaults.set(filterVolumeValue, forKey: FilterKeys.volume.rawValue)
        defaults.set(filterBatchValue, forKey: FilterKeys.returnBatch.rawValue)
        defaults.synchronize()
    }
    
    
    func loadSavedPreviousDefaultValue(){
        priceSlider.value = Float(defaults.double(forKey: FilterKeys.price.rawValue))
        alcoholSlider.value = Float(defaults.float(forKey: FilterKeys.alcohol.rawValue))
        volumeSlider.value = Float(defaults.integer(forKey: FilterKeys.volume.rawValue))
        batchStepper.value = Double(defaults.integer(forKey: FilterKeys.returnBatch.rawValue))
    }
    
    

}
