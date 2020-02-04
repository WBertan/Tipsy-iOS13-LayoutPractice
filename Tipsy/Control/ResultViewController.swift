//
//  ResultViewController.swift
//  Tipsy
//
//  Created by William Da Silva on 04/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill: Bill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", bill.totalPerPerson)
        settingsLabel.text = "Split between \(bill.numberOfPeople) people, with \(bill.tipPerc) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
