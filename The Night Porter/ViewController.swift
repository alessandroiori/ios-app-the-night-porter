//
//  ViewController.swift
//  The Night Porter
//
//  Created by Alessandro Iori on 01/05/2020.
//  Copyright © 2020 Alessandro Iori. All rights reserved.
//

import UIKit // core network for any iOS application

// View is anything that is cabable of drawing itself in a rectangular region on iOS screen. View object: Label, button, img, bar ecc
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackground(_ sender: Any) {
        // "view" acts as container of the application, top-level view object that contains subviews: Label, button ecc
        view.backgroundColor = UIColor.darkGray
        
        
        // array of subview (unwrap optional)
        let everything = view.subviews
        
        for eachView in everything {
            // is it a label? (not button)
            if eachView is UILabel {
                // downcast as UILabel from UIView
                let currentLabel = eachView as! UILabel
                currentLabel.textColor = UIColor.lightGray
            }
        }
        
        /*
        // compact way
        let UILabelOnly = view.subviews
            .filter { $0 is UILabel } // is it a label? (not button)
            .map { $0 as! UILabel} // downcast as UILabel from UIView
        
        for label in UILabelOnly {
            label.textColor = UIColor.lightGray
        }
        */
        
    }
}

