//
//  HowlViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/11/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//
import UIKit
import MessageUI
import MapKit
import WatchKit
import Foundation
import Dispatch

class HowlViewController: OperationLogic{
    var array = [AnyObject]()
    var manager: CLLocationManager!
    var address = ""
    var cname = ""
    var buildings = [CLLocation]()
    var nearBuildings = [CLLocation]()
    var phone = ""
    var emNumGlobe = ""
    
    @IBOutlet weak var countLabel: UILabel!
    @IBAction func backToViewController(segue:UIStoryboardSegue) {
        
    func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        buildings.append(userLocation)
    }
    
    func viewDidLoad() {
        super.viewDidLoad()
        
        /* This is going to be the long press emergency contact gesture */
        let UILongPress = UILongPressGestureRecognizer(target: self, action: "action1:")
        //We need to implement a force touch capability
        //var forceTouchCapability: UIForceTouchCapability{ get }
        UILongPress.minimumPressDuration = 1.0
        view.addGestureRecognizer(UILongPress)
        
        /* This is going to allow the view to segue over to the map view */
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "mapSegue:")
        
        //swipeGesture.description = "left"
        view.addGestureRecognizer(swipeGesture)
        
        /* This is going to bring up the user interface for sendingo out the emergency location */
        let tapGesture = UITapGestureRecognizer(target: self, action: "action:")
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func DBparser(function: Void -> Void){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 3), function)
    }
    
    func Background(function: Void -> Void) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 2), function)
    }
    
    func action1(gestureRecognizer:UIGestureRecognizer) {
        /* This is going to send out the emergency call to dispatch */
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            let tempNum = NSUserDefaults.standardUserDefaults()
            
            emNumGlobe = (tempNum.stringForKey("policeNumber"))!
            print("got and set policenum")
    
            //This will be based on the user's location and country
            UIApplication.sharedApplication().openURL(NSURL(string: emNumGlobe)!)
        }
        
    }
    
    func mapSegue(gestureRecognizer:UIGestureRecognizer) {
        /*  This will detect a swipe gesture that will allow the user to access the map that will show the UIMap    */
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        /* This will send out your emergency location */
        if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            //This is going to get the phone number of the user's phone
            let url:NSURL = NSURL(string:phone)!
            UIApplication.sharedApplication().openURL(url);
         
        }
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func HowllocManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) // This location manger mangages just the location configuration for Howl and does not refer to the CLLocationManager function
    {
        Background{
            CLGeocoder().reverseGeocodeLocation(userLocation){_,_ in
                let p = CLPlacemark()
                var title = ""
                var city = ""
                var state = ""
                var postalCode = ""
                var country = ""
                //We get the user's information from the GPS coor
                var subThoroughfare:String = " "
                var thoroughfare:String = " "
                
                if (p.subThoroughfare != nil) {
    
                    subThoroughfare = (p.subThoroughfare)!

                    city = (p.locality)!
                    state = (p.administrativeArea)!
                    postalCode = ((p.postalCode))!
                    country = (p.country)!
                }
                    
                if (p.thoroughfare != nil) {
                        
                    thoroughfare = (p.thoroughfare)!
                        
                }
                    title = "\(subThoroughfare) \(thoroughfare)"
                    self.address = "\(title) \(city) \(state) \(postalCode) \(country)"
                    self.cname = "\(country)"
                    self.countLabel.text = "(city), (state), (postalCode), (country)"
                }//    This closes the CLGeocoder block
             DBparser{
                ContList().getData(self.cname);
                print("database parsed")
                
            }
            
        }
    }

}
}

