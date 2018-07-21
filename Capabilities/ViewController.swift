//
//  ViewController.swift
//  Capabilities
//
//  Created by Antoine Weber on 21/07/2018.
//  Copyright © 2018 Antoine Weber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gestureLabel: UILabel!
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        gestureLabel.text = "swiped"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

