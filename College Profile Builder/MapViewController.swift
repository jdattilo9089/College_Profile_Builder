//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by student1 on 4/11/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapConnection: MKMapView!
    
    var currentCollege = College()
    
    var locationsOfCollege = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapConnection.delegate = self
        //HI
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
          @IBAction func dismissBtn(sender: UIBarButtonItem) {
            dismissViewControllerAnimated(true, completion: nil)
    
        }

   

    }
    
   

