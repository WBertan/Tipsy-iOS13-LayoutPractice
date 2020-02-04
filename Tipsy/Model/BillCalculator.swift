//
//  BillCalculator.swift
//  Tipsy
//
//  Created by William Da Silva on 04/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct BillCalculator {
    var billTotal: Float?
    var tipPercValue: String
    var splitBy: Int
    
    func calculate() -> Bill? {
        if let billTotal = billTotal, let tipValue = Float(tipPercValue.replacingOccurrences(of: "%", with: "")) {
            let totalTip = billTotal * (tipValue / 100)
            let totalToPay = billTotal + totalTip
            let totalPerPerson = totalToPay / Float(splitBy)
            return Bill(
                billTotal: billTotal,
                tipPerc: tipPercValue,
                numberOfPeople: splitBy,
                totalToPay: totalToPay,
                totalPerPerson: totalPerPerson
            )
        } else {
            return nil
        }
    }
}
