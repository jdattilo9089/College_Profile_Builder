//
//  PhotoViewController.swift
//  College Profile Builder
//
//  Created by student1 on 3/14/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var count = 0
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.picker.delegate = self
        self.picker.allowsEditing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        }
    }
    
    @IBAction func getPictureOnTapped(sender: UIBarButtonItem) {
        let actionsheet = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! DetailsViewController
        nvc.image = image
        
    }
}