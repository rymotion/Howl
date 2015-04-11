//
//  PictureViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/10/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
<<<<<<< HEAD
    @IBOutlet var profileImage: UIImageView!
=======
    @IBOutlet var profilePic: UIImageView!
>>>>>>> refs/remotes/origin/master
    
    @IBAction func setImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
<<<<<<< HEAD
=======
    @IBAction func chooseImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        profilePic.image = image

    }
    
    
>>>>>>> refs/remotes/origin/master
    func displayAlert(title: String, error: String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // if user tries to use app without image

       
    }
    
    override func viewDidAppear(animated: Bool) {
        
<<<<<<< HEAD
        if profileImage.image == nil {
=======
        if profilePic.image == nil {
            
>>>>>>> refs/remotes/origin/master
            self.displayAlert("Please select an image to get full functionality of this app", error: "")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
