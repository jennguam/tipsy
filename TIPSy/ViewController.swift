//
//  ViewController.swift
//  TIPSy
//
//  Created by Jenn Leung on 1/6/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet var line: UIView!
    @IBOutlet weak var tipText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0);
        
        totalLabel.alpha = 0
        tipLabel.alpha = 0
        tipControl.alpha = 0
        line.alpha = 0
        tipText.alpha = 0
        billAmountText.alpha = 0.5
        billField.center.y = 225
        billField.becomeFirstResponder()
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.billField.center.y = 75
            self.totalLabel.alpha = 1
            self.tipLabel.alpha = 1
            self.tipControl.alpha = 1
            self.billAmountText.alpha = 0
            self.line.alpha = 0.5
            self.tipText.alpha = 0
        })
       
        var tipPercentages = [0.15, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
       
        let tip = billAmount * tipPercentage
        let total = billAmount+tip
        print(billAmount);
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}