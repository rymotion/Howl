//
//  TestViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/11/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit
import MessageUI

class TestViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBAction func backToViewController(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("seugued ok")
        
        
        var UILongPress = UILongPressGestureRecognizer(target: self, action: "action:")
        UILongPress.minimumPressDuration = 1.0
        
        view.addGestureRecognizer(UILongPress)

    }
    
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            println("gesture")
            let phone = "tel://9099124128"
            let url:NSURL = NSURL(string:phone)!
            //UIApplication.sharedApplication().openURL(url)
            
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = "This will be the location";
                controller.recipients = ["9099124128"]
                controller.messageComposeDelegate = self;
                self.presentViewController(controller, animated: true, completion: nil);
            }
            
        }
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
