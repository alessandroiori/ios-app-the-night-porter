//
//  ViewController.swift
//  The Night Porter
//
//  Created by Alessandro Iori on 01/05/2020.
//  Copyright © 2020 Alessandro Iori. All rights reserved.
//

import UIKit // core network for any iOS application

// View is anything that is cabable of drawing itself in a rectangular region on iOS screen. View object: Label, button, img, bar ecc
class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Thi is cell for \(indexPath.row)" // '?' because default cell does have textLabel but it is defined as optiona, so we use '?' to unwrap
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /*
     IB Interface Builder
     Outlet: from code to .storyboard (XCODE property)
     . 'weak' attribute beacouse this label object it's not own by the ViewController class, we are non responsable to instantiating the label object and taking care of its lifecicle. Label object it's instantiate by .storyboard and it owns the lifecicle. We need just a reference to give a name (modelLabel)
     . '!' optional
     */
    @IBOutlet weak var modeLabel: UILabel!
    
    //Action: from .storyboard to code (XCODE method)
    @IBAction func changeBackground(_ sender: Any) {
       
        modeLabel.text = "Mode: Dark"
        
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
        
        // MVC Model (data) View (presentation/interaction) Controller (logics between Model and View)
        
        /*
         iOS Table View
         . it is a view object
         . it is a one column wide vith multiple rows
         . every row has single cell that contains the content (eg. view labels ecc)
         
         
         */
        
    }
}

