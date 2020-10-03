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
    
    
    
    //MARK: - Application LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - IBAction Methods
    @IBAction func buttonsAction(_ sender: Any) {
        
        
        
    }
    
   
}

