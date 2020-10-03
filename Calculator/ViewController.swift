//
//  ViewController.swift
//  Calculator
//
//  Created by Mahmoud Sherbeny on 9/23/20.
//  Copyright © 2020 Mahmoud Sherbeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - IBOutlet
    @IBOutlet var calcButton: [UIButton]! {
        didSet {
            for btn in calcButton {
                btn.layer.cornerRadius = btn.frame.height / 2
            }
        }
    }
    
    @IBOutlet weak var restLblView: UILabel!
    
    //MARK: - Variables
    var operation: Int!
    var numberOne: Float?
    
    
    //MARK: - Application LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - IBAction Methods
    @IBAction func buttonsAction(_ sender: Any) {
        
        let buttonNum = (sender as! UIButton).tag
        
        switch buttonNum {
        case 0...9:
            removeZero()
            restLblView.text = restLblView.text! + "\(buttonNum)"
            
        case 10:
            if !restLblView.text!.contains(".") {
                restLblView.text = restLblView.text! + "."
            }
            
        case 11:
            guard let FN = numberOne else  {
                return
            }
            restLblView.text = "\(getResult(FN: FN, SN: Float(restLblView.text!)!, operation: operation))"
            
        case 12...16:
            numberOne = Float( restLblView.text! )
            operation = buttonNum
            clearResult()
            
        case 17:
            if restLblView.text!.contains("-") {
                restLblView.text!.removeFirst()
            } else {
                if restLblView.text! != "0" {
                    restLblView.text! = "-" + restLblView.text!
                }
            }
            
        case 18:
            clearResult()
        default: break
        }
        
    }
    
    //MARK: - Helper Methods
    func clearResult() {
        restLblView.text = "0"
    }
    
    func removeZero() {
        if restLblView.text == "0" {
            restLblView.text = ""
        }
    }
    
    func getResult(FN: Float, SN: Float, operation: Int) -> Float {
        switch operation {
        case 12:
            return FN + SN
        case 13:
            return FN - SN
        case 14:
            return FN * SN
        case 15:
            return FN / SN
        case 16:
            return Float(Int(FN) % Int(SN))
        default:
            return 0
        }
    }
}

