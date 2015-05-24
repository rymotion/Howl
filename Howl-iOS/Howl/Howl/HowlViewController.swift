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

class HowlViewController: UIViewController, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate {
    var array = [AnyObject]()
    var manager: CLLocationManager!
    var address = ""
    var buildings = [CLLocation]()
    var nearBuildings = [CLLocation]()
    @IBAction func backToViewController(segue:UIStoryboardSegue) {
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        buildings.append(userLocation)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var array: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("emergencyNumbers")
            println(array)
        /* This is going to be the long press emergency contact gesture */
        var UILongPress = UILongPressGestureRecognizer(target: self, action: "action1:")
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
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
        for builings in nearBuildings {
            
            println(buildings)
            
        }
        
    }
    func beginBackgroundTaskWithName(getEmNum: String?, expirationHandler handler: (() -> Void)?) -> UIBackgroundTaskIdentifier;){
        /*  This is going to read the SQLite database that will get the correct emergency number based on the country the user is in called in from the locationManager function    */
        var EmNum = ""
        if (EmNum == nil) {
            /*  This is going to get the emergency number (AKA EmNum) by taking the user's location and running it through the database if the location matches with one on the database it will set that emergency number accordingly  */
        }
    }
    func endBackgroundTask(getEmNum: UIBackgroundTaskIdentifier)
    func getRec(/*  This is going to run the shit that will get the contacts    */){
        /*  This is going to be the code that will be put in to generate the group text */
    }
    
    func action1(gestureRecognizer:UIGestureRecognizer) {
        /* This is going to send out the emergency call to dispatch */
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            //This will be based on the user's location and country
            let phone = /*"tel://911"*/
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    func mapSegue(gestureRecognizer:UIGestureRecognizer) {
        /*  This will detect a swipe gesture that will allow the user to access the map that will show the UIMap    */
    }
    func action(gestureRecognizer:UIGestureRecognizer) {
        /* This will send out your emergency location */
        if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            //This is going to get the phone number of the user's phone
            let phone = ""
            let url:NSURL = NSURL(string:phone)!
            //UIApplication.sharedApplication().openURL(url)
         
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = "The emergency location is \(userLocation.coordinate.latitude) \(userLocation.coordinate.longitude) \(address) "
                controller.recipients = []// This is going to get the contacts from the phone itself
                controller.messageComposeDelegate = self;
                self.presentViewController(controller, animated: true, completion: nil);
            }
         
        }
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        // centers map on users location
        userLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            
            var title = ""
            var city = ""
            var state = ""
            var postalCode = ""
            var country = ""
    
            if (error == nil) {
                
                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                    
                    var subThoroughfare:String = ""
                    var thoroughfare:String = ""
                    
                    if p.subThoroughfare != nil {
    
                        subThoroughfare = p.subThoroughfare

                        city = p.locality
                        state = p.administrativeArea
                        postalCode = p.postalCode
                        country = p.country
                    }
                    
                    if p.thoroughfare != nil {
                        
                        thoroughfare = p.thoroughfare
                        
                    }
                    title = "\(subThoroughfare) \(thoroughfare)"
                    self.address = "\(title) \(city) \(state) \(postalCode) \(country)"
                }
            }
        })
    }
}
