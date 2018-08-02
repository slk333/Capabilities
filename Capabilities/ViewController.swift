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
    @IBAction func pinch(_ sender: UISwipeGestureRecognizer) {
        gestureLabel.text = "pinched"
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        gestureLabel.text = "tapped"
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        gestureLabel.text = "rotation"
    }
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
         gestureLabel.text = "long press"
    }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

