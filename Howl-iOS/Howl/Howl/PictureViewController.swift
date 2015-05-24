//
//  PictureViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/10/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit
import WatchKit
import AVFoundation

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profilePic: UIImageView!
    @IBAction func setImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        profilePic.image = image
        NSUserDefaults.standardUserDefaults().setObject(UIImagePNGRepresentation(image), forKey: "profilePic")
    }
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
        println("view did appear called")
        var image: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("profilePic")
        if image == nil {
            self.displayAlert("Please take a photo to get full functionality", error: "")
        } else {
            println("segue")
            self.performSegueWithIdentifier("basicSegue", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
