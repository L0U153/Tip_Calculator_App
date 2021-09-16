//
//  HW4AccessibilityIdentifiers.swift
//  HW4
//
//  Created by Harrison Weinerman on 8/24/18.
//  Copyright © 2018 Harrison Weinerman. All rights reserved.
//

/// Contains accessibility identifiers used in ITP-342 HW4 for grading.
/// Don't change the contents of this file.
struct HW4AccessibilityIdentifiers {
    
    // UI components that you can interact
    static let billTextField = "billTextField"
    static let taxPercentSegmentedControl = "taxPercentSegmentedControl"
    static let tipPercentSlider = "tipPercentSlider"
    static let roundUpSwitch = "roundUpSwitch"
    static let splitStepper = "splitStepper"
    static let resetButton = "resetButton"
    
    // all the dyamic labels that will change based on userinput
    static let tipPercentSliderAmountLabel = "tipPercentSliderAmountLabel"
    static let splitStepperAmountLabel = "splitStepperAmountLabel"
    static let taxAmountLabel = "taxAmountLabel"
    static let tipAmountLabel = "tipAmountLabel"
    static let tipSplitAmountLabel = "tipSplitAmountLabel"
    static let totalAmountLabel = "totalAmountLabel"
    static let totalSplitAmountLabel = "totalSplitAmountLabel"
    
    //static labels that dont change - title labels
    static let tipCalculaterLabel = "tipCalculaterLabel"
    static let billLabel = "billLabel"
    static let taxPercentSegmentedLabel = "taxPercentSegmentedLabel"
    static let roundUpLabel = "roundUpLabel"
  
    //for your view - you only need to connect 1 view
    static let view = "oneView"
    
}
