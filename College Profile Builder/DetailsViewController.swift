//
//  DetailsViewController.swift
//  College Profile Builder
//
//  Created by student1 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.


import UIKit

class DetailsViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentCollege = College()
    var counter = 0
    var counter2 = 0
    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var count = 0
    var image = UIImage()
    

    
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var edit: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var informationTextField: UITextField!
    @IBOutlet weak var numberStudentsTextField: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var numberOfStudents: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = currentCollege.name
        location.text = currentCollege.location
        information.text = currentCollege.description
        numberOfStudents.text = String(currentCollege.numberOfStudents)
        website.text = currentCollege.webView
        self.navigationItem.title = currentCollege.name
        imageView.image = UIImage(named: currentCollege.image)
     
        
        self.picker.delegate = self
        self.picker.allowsEditing = true
        
        
    }
    
    @IBAction func choosePhotoBtn(sender: UIButton) {
        let actionsheet = UIAlertController(title: "Title", message: nil, preferredStyle: .ActionSheet)
        actionsheet.popoverPresentationController?.sourceView = self.view
        actionsheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let libraryButton = UIAlertAction(title: "PHOTO LIBRARY", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
            
        }
        let cameraButton = UIAlertAction(title: "CAMERA", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.picker, animated: true, completion: nil)
            
        }
        
        actionsheet.addAction(libraryButton)
        actionsheet.addAction(cameraButton)
        
        
        presentViewController(actionsheet, animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        counter++
        if counter == 1{
            edit.title = "Save"
            nameTextField.alpha = 1
            locationTextField.alpha = 1
            informationTextField.alpha = 1
            numberStudentsTextField.alpha = 1
            websiteTextField.alpha = 1
            name.alpha = 0
            location.alpha = 0
            information.alpha = 0
            numberOfStudents.alpha = 0
            website.alpha = 0
            nameTextField.text = name.text
            locationTextField.text = location.text
            informationTextField.text = information.text
            numberStudentsTextField.text = numberOfStudents.text
            websiteTextField.text = website.text
            self.navigationItem.title = currentCollege.name
        }
        if counter == 2{
            edit.title = "Edit"
            nameTextField.alpha = 0
            locationTextField.alpha = 0
            informationTextField.alpha = 0
            numberStudentsTextField.alpha = 0
            websiteTextField.alpha = 0
            name.alpha = 1
            location.alpha = 1
            information.alpha = 1
            numberOfStudents.alpha = 1
            website.alpha = 1
            name.text = nameTextField.text
            location.text = locationTextField.text
            information.text = informationTextField.text
            numberOfStudents.text = numberStudentsTextField.text
            website.text = websiteTextField.text
            NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
            counter = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let rvc = segue.destinationViewController as? WebViewController {
            rvc.currentCollege = currentCollege
        }
        if let tvc = segue.destinationViewController as? MapViewController{
            tvc.currentCollege = currentCollege
        }
    }
    
    func animateImage(){
        if self.photos.count > 0{
            if self.count < self.photos.count - 1 && self.photos.count != 1{
                self.count++
            }
            else{
                self.count = 0
                
                UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in},
                    completion: { (finished) -> Void in
                        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
                            }, completion: { (finished) -> Void in
                        })
                })
            }
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.image = (info[UIImagePickerControllerEditedImage] as! UIImage)
            self.dismissViewControllerAnimated(true, completion: nil)
            self.imageView.image = self.image
            
        }
    }
    
    @IBAction func getPictureOnTapped(sender: UIBarButtonItem) {
    }

}