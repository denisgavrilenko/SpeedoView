//
//  ViewController.swift
//  SpeedoExample
//
//  Created by dhaurylenka on 2/15/18.
//  Copyright © 2018 dg. All rights reserved.
//

import UIKit
import SpeedoView

class ViewController: UIViewController {
    @IBOutlet weak var speedo: Speedo!
    
    var value = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onButton(_ sender: Any) {
        value += 5
        speedo.setValue(value)
    }
}

