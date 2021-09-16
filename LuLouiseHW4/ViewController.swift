//
//  ViewController.swift
//  LuLouiseHW4
//
//  Created by Student on 2/12/20.
//  Copyright © 2020 Louise Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //properties
    
    @IBOutlet weak var background2Button: UIButton!
    @IBOutlet weak var background1Button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tipCalculatorInfoView: UIView!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var taxSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var roundUpLabel: UILabel!
    @IBOutlet weak var roundUpSwitch: UISwitch!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitNumLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var taxDisplayLabel: UILabel!
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var tipSplitDisplayLabel: UILabel!
    @IBOutlet weak var totalDisplayLabel: UILabel!
    @IBOutlet weak var totalSplitDisplayLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    //instance variables
    var bill:Double=0.00
    var taxPercent:Double=0.80
    var tax:Double=0.00
    var tipPercent:Double=0.15
    var tip:Double=0.00
    var total:Double=0.00
    var tipSplit:Double=0.00
    var totalSplit:Double=0.00
    var splitNum:Int=1
    var roundUp:Bool=false
    
    //helper function
    func round2(_ value: Double) -> Double {
        return (value * 100).rounded() / 100
    }
    
    func setDefaultValues(){
        bill=0.00
        taxPercent=0.080
        tax=0.00
        tipPercent=0.15
        tip=0.00
        total=0.00
        tipSplit=0.00
        totalSplit=0.00
        splitNum=1
        roundUp=false
    }
    
    func updateUI(){
        //calculation
        tax = round2(bill * taxPercent)
        tip = round2(bill * tipPercent)
        total = round2(bill + tax + tip)
        if (roundUp){
            let diff = abs(ceil(total)-total)
            tip = round2(tip + diff)
        }
        total = round2(bill + tax + tip)
        tipSplit = round2(tip/Double(splitNum))
        totalSplit=round2(total/Double(splitNum))
        
        //changing UI
        tipPercentLabel.text="\(Int(tipPercent*100))%"
        splitNumLabel.text="\(splitNum)"
        taxDisplayLabel.text="Tax $\(String(format: "%.2f", tax))"
        tipDisplayLabel.text="Tip $\(String(format: "%.2f", tip))"
        totalDisplayLabel.text="Total $\(String(format: "%.2f", total))"
        tipSplitDisplayLabel.text="Tip Split $\(String(format: "%.2f", tipSplit))"
        totalSplitDisplayLabel.text="Total Split $\(String(format: "%.2f", totalSplit))"
        
    }


    
    //method
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultValues()
        // Do any additional setup after loading the view.
        billTextField.accessibilityIdentifier=HW4AccessibilityIdentifiers.billTextField
        taxSegmentedControl.accessibilityIdentifier=HW4AccessibilityIdentifiers.taxPercentSegmentedControl
        tipPercentSlider.accessibilityIdentifier=HW4AccessibilityIdentifiers.tipPercentSlider
        roundUpSwitch.accessibilityIdentifier=HW4AccessibilityIdentifiers.roundUpSwitch
        splitStepper.accessibilityIdentifier=HW4AccessibilityIdentifiers.splitStepper
        resetButton.accessibilityIdentifier=HW4AccessibilityIdentifiers.resetButton
        tipPercentLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.tipPercentSliderAmountLabel
        splitNumLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.splitStepperAmountLabel
        taxDisplayLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.taxAmountLabel
        tipDisplayLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.tipAmountLabel
        tipSplitDisplayLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.tipSplitAmountLabel
        totalDisplayLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.totalAmountLabel
        totalSplitDisplayLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.totalSplitAmountLabel
        titleLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.tipCalculaterLabel
        billLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.billLabel
        taxLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.taxPercentSegmentedLabel
        roundUpLabel.accessibilityIdentifier=HW4AccessibilityIdentifiers.roundUpLabel
        tipCalculatorInfoView.accessibilityIdentifier=HW4AccessibilityIdentifiers.view
        
        
        
    }
    
    @IBAction func billIsEntered(_ sender: Any) {
        billTextField.becomeFirstResponder()
        if let value=billTextField.text{
            if let value2=Double(value){
                bill=value2
            }
            else{   //deal with the situation of deleting the last digits in bill
                bill=0.00
            }
        }
        else{
            bill=0.00
        }
        updateUI()
    }
    
    @IBAction func taxIsEntered(_ sender: Any) {
        let value=taxSegmentedControl.titleForSegment(at: taxSegmentedControl.selectedSegmentIndex)!
        taxPercent=Double(value)!/100.0
        updateUI()
    }
    
    @IBAction func tipIsEntered(_ sender: Any) {
        tipPercent=Double(Int(round(tipPercentSlider.value)))/100.0
        //print(tipPercent)
        updateUI()
    }
    
    @IBAction func roundUpIsChanged(_ sender: Any) {
        if(roundUp){
            roundUp=false
        }
        else{
            roundUp=true
        }
        updateUI()
    }
    
    @IBAction func splitIsEntered(_ sender: Any) {
        splitNum=Int(splitStepper.value)
        updateUI()
    }
    
    @IBAction func resetIsPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Clear All Values", message: "Are you sure you want to clear all values?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Clear All", style: .destructive, handler: { (_) in
            self.setDefaultValues()

            self.billTextField.text=""
            self.taxSegmentedControl.selectedSegmentIndex=0
            self.tipPercentSlider.setValue(15, animated: true)
            self.roundUpSwitch.setOn(true, animated: false)
            self.splitStepper.value=1
            self.updateUI()
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            //do nothing
        }))
        self.present(alert, animated: true, completion: {
            //
        })
    }
    
    @IBAction func backgroundIsTapped(_ sender: Any) {
        billTextField.resignFirstResponder()
        
    }
    
    
}

