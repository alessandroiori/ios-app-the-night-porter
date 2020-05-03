//
//  ViewController.swift
//  The Night Porter
//
//  Created by Alessandro Iori on 01/05/2020.
//  Copyright © 2020 Alessandro Iori. All rights reserved.
//

import UIKit // core network for any iOS application

// View is anything that is cabable of drawing itself in a rectangular region on iOS screen. View object: Label, button, img, bar ecc
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /* Multiple Scene
     1. Create a new View Controller scene
     2. Add new class to the project: SecondViewController with inherit from UIViewController
     3. connect the firs scene with the second
     
     click on view controller > Library ('+') > drag and drop 'View Controller' inside Mian.board (main)
     
     Create new swit class for new scene
     File > new > File.. > Cocoa Touch Class > Name: 'SecondViewClass', Subclas of: 'UIViewController' > create
     
     Connect new View Controller Scene (.storyboard) to SecondViewScene
     Main.storyboard > click on new View Controller Scene > Show Inspectors > click identity inspector > class: Second View Controller
     
     Connect scenes
     1. Add button on first scene
     2. ctrl + drag drop on second scene
     3. Action schow
     */
    
    
    let dailyTasks = ["AAAAA", "BBBBB", "CCCCC", "DDDDD", "FFFFFFF", "GGGGGGG"]
    let weeklyTasks = ["AAAAA", "BBBBB", "CCCCC"]
    let monthlyTasks = ["AAAAA", "BBBBB", "CCCCC"]
    
    /*
     iOS Table View
     . it is a view object
     . it is a one column wide vith multiple rows
     . every row has single cell that contains the content (eg. view labels ecc)
     . we use UITableViewDataSource Protocol for manage section, row and cell content
     . we use UITableViewDelegate Protocol for manage interactivity and apparence, used to delegate behavior or apparence
     
     */
    
    // Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected section: \(indexPath.section), row: \(indexPath.row)")
    }
    
    // Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3 // one for dayly, one weekly and one for monthly
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Instantiate new Table View Cell
        //let cell = UITableViewCell()
        
        /*
        if we have a 10000 row is inefficient instantiate every time a new new cell. It's possible reuse iOS Table View Cell non used (that not appear on the screen)
        
        identifier because TableView can have different tipe of reusable cell. We don't have differnt cell, so we identify them with "normalCell".
        If there is no reusable cell, the method return a new cell instance.
        We asking for a cell identifier "normalCell", TableView do not know this style/tyoe of cell. We must add this cell type on the storyboard. Storyboard > object library > Table View Cell > drag and drop inside Table View object (now there is a new subview under table view on the left) > select subview Table View Cell > open Atribute inspector > add "normalCell" as identifier field
        
        */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        /*
         Image on the left of the cell.
         Assets.xcassets > '+' > drag and drop 3 same images with different size (1, 2x, 3x) iOS select automatically the best size. Doble click on the set name and rename with 'clock'
         */
        cell.imageView?.image = UIImage.init(named: "clock")
        
        // Accessory on the right of the cell
        cell.accessoryType = .disclosureIndicator // its a enumeration we can use .nameOfType
    
        /*
        Default cell style do not show detail label
            Main.storyboard > click on TableView/normalCell > Atributes inspector > style > Subtitle
         */
        cell.detailTextLabel?.text = "Detail text label"
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row] // '?' because default cell does have textLabel but it is defined as optiona, so we use '?' to unwrap
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "Error "
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }

    /*
     MVC
     Model (data)
     View (presentation/interaction)
     Controller (logics between Model and View)
     */
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

