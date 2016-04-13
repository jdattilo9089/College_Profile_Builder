//
//  CollegeListViewController.swift
//  College Profile Builder
//
//  Created by student1 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var numberOfStudents: UITextField!
    @IBOutlet weak var descripBox: UITextField!
   
    var collegeArray:[College] = [College]()

    var newCollege = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(sender: UIBarButtonItem) {
    }
}
