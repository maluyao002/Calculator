//
//  ViewController.swift
//  Calculator
//
//  Created by luyao ma on 3/1/15.
//  Copyright (c) 2015 luyao ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    
    var usertypingvalue: Bool = false

    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton){
      let digit = sender.currentTitle!
        if usertypingvalue{
            display.text = display.text! + digit
        }else{
            display.text = digit
            usertypingvalue = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if usertypingvalue{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        usertypingvalue = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double{
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

