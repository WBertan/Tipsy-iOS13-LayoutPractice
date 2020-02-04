//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    private var billCalculator = BillCalculator(billTotal: nil, tipPercValue: "10%", splitBy: 2)
    
    @IBAction func totalValueChanged(_ sender: UITextField) {
        if !sender.text!.isEmpty && Float(sender.text!) == nil {
            sender.text?.removeLast()
        }
        billCalculator.billTotal = Float(sender.text!)
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        totalTextField.endEditing(true)
        
        resetTipSelection()
        sender.isSelected = true
        billCalculator.tipPercValue = sender.currentTitle!
    }
    
    private func resetTipSelection() {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        billCalculator.splitBy = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let bill = billCalculator.calculate() {
            performSegue(withIdentifier: "goToResult", sender: bill)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            (segue.destination as! ResultViewController).bill = (sender as! Bill)
        }
    }
    
}

