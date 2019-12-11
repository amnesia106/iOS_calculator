//
//  ViewController.swift
//  Taschenrechner
//
//  Created by Kevin Seibel on 10.12.19.
//  Copyright © 2019 Kevin Seibel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var userIsInTheMiddelOfTyping:Bool = false
    
    var decimalUsing = false
    
    
    var firstNumber: Double = 0.0
    var secondNumber: Double = 0.0
    var result: Double = 0.0
    var choosingOperator: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func keypadTapped(_ sender: UIButton) {
        var key = sender.currentTitle!
        print(key)
        
        if userIsInTheMiddelOfTyping == true {
            
            if decimalUsing == true && key == "." {
                key = ""
            }
            
            resultLabel.text = resultLabel.text! + key
        } else {
            resultLabel.text = key
            userIsInTheMiddelOfTyping = true
        }
        
        if key == "." {
                decimalUsing = true
        
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        
        if resultLabel.text != "." {
            
            firstNumber = Double(resultLabel.text!)!
                   
                   userIsInTheMiddelOfTyping = false
                   choosingOperator = sender.currentTitle!
                   decimalUsing = false
        }
        
       
    }
    
    
    @IBAction func equalsTapped(_ sender: UIButton) {
        secondNumber = Double(resultLabel.text!)!
        
        calculate(_operator: choosingOperator)
        
        resultLabel.text = String(result)
        userIsInTheMiddelOfTyping = false
        decimalUsing = false
    }
    
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        resultLabel.text = "0"
        secondNumber = 0
        firstNumber = 0
        result = 0
        choosingOperator = ""
        
        userIsInTheMiddelOfTyping = false
        decimalUsing = false
        
    }
    
    
    func calculate(_operator: String) {
        
        switch _operator {
        case "+": result = firstNumber + secondNumber
        case "-": result = firstNumber - secondNumber
        case "x": result = firstNumber * secondNumber
        case "÷": result = firstNumber / secondNumber
        default:
            break
        }
        
    }

}

