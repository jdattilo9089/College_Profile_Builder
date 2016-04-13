//
//  ViewController.swift
//  College Profile Builder
//
//  Created by student1 on 2/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var collegeTableView: UITableView!
    
    var counter = 0
    var collegeArray:[College] = [College]()
        
    @IBOutlet weak var editButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        editButton.tag = 0
        collegeArray.append(College(Name: "University of Michigan of Ann Arbor", Description: "Has a 26.25% acceptance rate", Location: "Ann Arbor, Michigan", NumberOfStudents: "43,625 students",Image: "um", WebView:"http://www.umich.edu"))
        collegeArray.append(College(Name: "University of North Carolina of Chapel Hill", Description: "Has a 29% acceptance rate.", Location: "Chapel Hill, North Carolina", NumberOfStudents: "29,135 students",Image: "unc",WebView: "http://www.unc.edu"))
        collegeArray.append(College(Name: "University of Miami" , Description: "Has a 66% acceptance rate.", Location: "Oxford, Ohio", NumberOfStudents: "18,456 students", Image: "miami", WebView: "http://www.miamioh.edu"))
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)

    }
    
    func loadList(notification: NSNotification){
        self.collegeTableView.reloadData()
    }
    
    @IBAction func addClicked(sender: UIBarButtonItem) {
    
        let alert = UIAlertController(title: "Add a College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        
        var nameField: UITextField!
        var locationField: UITextField!
        var numberField: UITextField!
        var description: UITextField!
        var website: UITextField!
        
        func nameTextField(textField: UITextField!)
        {
            textField.placeholder = "College Name"
            nameField = textField
        }
        func locationTextField(textField: UITextField!)
        {
            textField.placeholder = "Location"
            locationField = textField
        }
        func numberTextField(textField: UITextField!)
        {
            textField.placeholder = "Number Of Students"
            numberField = textField
        }
        func descriptionTextField(textField: UITextField!)
        {
            textField.placeholder = "Acceptance Rate"
            description = textField
        }
        func websiteTextField(textField: UITextField!)
        {
            textField.placeholder = "Website URL"
            website = textField
        }

        alert.addTextFieldWithConfigurationHandler(nameTextField)
        alert.addTextFieldWithConfigurationHandler(locationTextField)
        alert.addTextFieldWithConfigurationHandler(numberTextField)
        alert.addTextFieldWithConfigurationHandler(descriptionTextField)
        alert.addTextFieldWithConfigurationHandler(websiteTextField)


        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:
            { (action) -> Void in
                nameField.resignFirstResponder()
                
                let numberVariable = Int(numberField.text!)
                self.collegeArray.append(College(Name: nameField.text!, Description: description.text!, Location: locationField.text!, NumberOfStudents: numberField.text!, Image: "",WebView: ""))
                self.collegeTableView.reloadData()
        })
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    
    }

    @IBAction func onTapped(sender: UIBarButtonItem) {
        
        if(sender.tag == 0) {
            collegeTableView.editing = true
            sender.tag = 1
            editButton.title = "Done"

        } else {
            collegeTableView.editing = false
            sender.tag = 0
            editButton.title = "Edit"

        }

    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            collegeArray.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = collegeArray[sourceIndexPath.row]
        collegeArray.removeAtIndex(sourceIndexPath.row)
        collegeArray.insert(college, atIndex: destinationIndexPath.row)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { 
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentCollege = collegeArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        currentCell.detailTextLabel?.text = currentCollege.location
        return currentCell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! DetailsViewController
        var currentCollege = collegeArray[(collegeTableView.indexPathForSelectedRow?.row)!]
        nvc.currentCollege = currentCollege

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}