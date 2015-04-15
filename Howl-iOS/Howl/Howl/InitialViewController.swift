//
//  InitialViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/11/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit

var contactNumbers = [String]()

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var contactTextField: UITextField!
    
    @IBAction func done(sender: AnyObject) {
        
        self.performSegueWithIdentifier("standardSegue", sender: self)
        
        NSUserDefaults.standardUserDefaults().setObject(contactNumbers, forKey: "emergencyNumbers") 
        
    }
    
    func displayAlert(title: String, error: String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTextField.delegate = self

        displayAlert("Enter emergency contact numbers", error: "")
        
        
        
        
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("emergencyNumbers") == nil) {
            
            println("put numbers")
            
        } else {
            
            self.performSegueWithIdentifier("standardSegue", sender: self)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        contactTextField.resignFirstResponder()  //if desired
        contactNumbers.append(contactTextField.text)
        contactTextField.text = ""
        println("return")
        
        println(contactNumbers)
        
        return true
    }
    
    
    
}
