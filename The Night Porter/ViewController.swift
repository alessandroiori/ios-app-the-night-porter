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
        
        tableView.backgroundColor = UIColor.clear //remove color from table wiew background
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
        
        cell.backgroundColor = UIColor.clear; //remove color backfround from cell
        
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
    
    
    /*
     
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
        
        
        // compact way
        //let UILabelOnly = view.subviews
        //    .filter { $0 is UILabel } // is it a label? (not button)
        //    .map { $0 as! UILabel} // downcast as UILabel from UIView
        //
        //for label in UILabelOnly {
        //    label.textColor = UIColor.lightGray
        //}
    }
    
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "First VC"
    }
    
    /*
     Added Toolbar with a swich inside
     ctrl + drag and drop here
     */
    
    @IBOutlet weak var darkModeLabel: UIBarButtonItem!
    
    @IBAction func togleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if(mySwitch.isOn)
        {
            darkModeLabel.isEnabled = true;
            view.backgroundColor = UIColor.darkGray
            
        } else {
            darkModeLabel.isEnabled = false;
            view.backgroundColor = UIColor.white
        }
    }
    
    /*
     Multiple Scene
     1. Create a new View Controller scene
     2. Add new class to the project: SecondViewController with inherit from UIViewController
     3. connect the firs scene with the second
     
     click on view controller > Library ('+') > drag and drop 'View Controller' inside Mian.board (main)
     
     Create new swit class for new scene
     File > new > File.. > Cocoa Touch Class > Name: 'SecondViewClass', Subclas of: 'UIViewController' > create
     
     Connect new View Controller Scene (.storyboard) to SecondViewScene
     Main.storyboard > click on new View Controller Scene > Show Inspectors (top right) > click identity inspector > class: Second View Controller
     
     Connect scenes
     1. Add button on first scene
     2. ctrl + drag drop on second scene
     3. Action schow
     */
    
    /*
     Navigation Bar
     Each View Controller appear inside an UIWindows. When we change from the View Controller to the Second View Controller, the UIWindows content is replaced with the new View Controller.
     Navigation bar is added inside UIWindows on the top. When we change the View Controller the content of UIWindows change but not the nav bar.
     Add Navigation Bar:
     Select the first View Controller > Editing > Embed In > Navigation Controller
     */
    
    /*
     TAB Bar
     New project > Tabbed App or Library ('+') > tab bar
    
     Add new Third Scene
     
     1. Create new swit class for new scene
     File > new > File.. > Cocoa Touch Class > Name: 'ThirdViewClass', Subclas of: 'UIViewController' > create
     
     2. Connect new View Controller Scene (.storyboard) to ThirdViewScene class
     Main.storyboard > click on new View Controller Scene > Show Inspectors > click identity inspector > class: Third View Controller
     
     3. Show on the Tab bar the new scene
     ctrl + Drad and drom from Tab Bar Controller to the new Third View Controller > Relationship Segue > view controllers
     
     Change properties of the third Tab Bar
     Click on the tab bar of the third scene > Select Image and
     
     */
    
    /*
     Constraints
     Rules/Relatiopnship between two piecies of our user interface, two view object.
     eg. buton position fixed on the top right corner at the same distance for every iPhone screen size
     
     Hold ctrl + drag button view element to the right on the brackground > "Trailing space to safe area"
     
     Constraints object are list in the left side below "Constraints"
     
     Add constrain between view object like Label View (title) and Text View:
     1. ctrl + drag Label on the top "Top space.."
     2. ctrl + drag Label on the top "Center Horizo.."
     3. ctrl + drag Text View on left "Leading.."
     4. ctrl + drag Text View on the right "Trailing"
     5. ctrl + drag Text View on the Label "Vertical Baseline"
     6. ctrl + drag Text View on his self "Horizontal" 

     Edit/Delete Contraints
     1. Select an Object View
     2. On the right bar click on the "Size inspector"
     3. Select the constrain and Edit or delete
     
     Easy way to create constraints
     1. Select an Object View
     2 Select "add new constraints" on the bottom right
     3. Select red line to add constraints
     
     Use Sugested Constraints
     1. Select "View" on the right bar
     2. Select "Resolve Auto Layout Issue" on the buttom right
     3. Reset to suggested constraints
     
     Resaze Image with Constraints
     1. Select image
     2. click on "Add new constraints" (bottom right)
     3. add constrain on heigh and width
     
     */
    
    /*
     Stack View
     take two or more view object and then stack them either horizontally or vertically. Stack view it is NOT an alternative to Table View Object.
     
     Select two or more items > Editor > Embeded In > Stack View
     */
    
    /*
     Traits
     - width
     - height
     - device family
     - color gamut
     
     "Vary Traits" button on the bottom right side: alow trait variation for our storiboard for a specific iOS device.
     
     "Vart for Traits" > Height and Width options
    
     Size Class to describe height and width (no pixels, no points)
     Size Class define groups of devices with similar characteristics (same resolution or screen size)
     For each device, one size class describe width and one size class describe height.
     
     iOS Size Class: regular or compact
     Each iOS device everytime have a regular or compact Size Class for the height ant the same for the width.
     
     iPhones:
     - portrait mode: regular height and compact width
     - landscape mmode: compact height and compact width
     
     iPhones Plus:
     - portrait mode: regular height and compact width
     - landscape mmode: compact height and regular width
     
     "(wC hR)" on the bottom lefth of the story board means: width compact, heiiight regular
     
     Make a customization for specific Size Class:
     1. view the storyboard in the width and height class you want customize
     2. click "Vary for Traits" button > select Size Class width or height > eg. if we select widht, customization is only for selected Size Class width on all View iphones/ipad in landscape mode
     
     It is possible customizate all objects view, eg. in landscape mode we want change image size and position, change background color and font size, show view object that in portrain mode is hiden
     
     Selecting "Vary for Traits" > height and width, with blue bar it is possible change properties for a specific view object: remove Constraints for a specific object and the object itself, so in the specif Size Class combination the view object is hiden while in other size class combination, the object view is shown.
     
     Customize specific View Object
     1. select view object
     2. Show attributes Inspector on the right side bar
     3. eg. change font size for height and width compact (wC hC) > click on the '+' button next the Font > Add Variation > select font size
     
     */
}

