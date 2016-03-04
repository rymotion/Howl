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

class HowlViewController: UIViewController, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate {
    var array = [AnyObject]()
    var manager: CLLocationManager!
    var address = ""
    var buildings = [CLLocation]()
    var nearBuildings = [CLLocation]()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        buildings.append(userLocation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("emergencyNumbers")
            print(array)
        
        /* This is going to be the long press emergency contact gesture */
        let UILongPress = UILongPressGestureRecognizer(target: self, action: "emNum:")
        UILongPress.minimumPressDuration = 1.0
        view.addGestureRecognizer(UILongPress)
        
        /* This is going to allow the view to segue over to the map view */
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "mapSegue:")
        swipeGesture.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeGesture)
        
        /* This is going to bring up the user interface for sendingo out the emergency location */
        let tapGesture = UITapGestureRecognizer(target: self, action: "smsSOS:")
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
        for _ in nearBuildings {
            
            print(buildings)
            
        }
    }
    
    func mapSegue(gestureRecognizer:UIGestureRecognizer) {
        
    }
    
    func smsSOS(gestureRecognizer:UIGestureRecognizer) {
        /* This will send out your emergency location */
        if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            
            //  Default to blank screen
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = "The emergency location is \(userLocation.coordinate.latitude) \(userLocation.coordinate.longitude) \(address) "
                controller.recipients = ["tel://909124128"]// This is going to get the contacts from the phone itself
                controller.messageComposeDelegate = self;
                self.presentViewController(controller, animated: true, completion: nil);
            }
        }
    }
    
    func emNum(gestureRecognizer:UIGestureRecognizer) {
        /* This is going to send out the emergency call to dispatch */
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            //This will be based on the user's location and country
            let _phone = "911";
            UIApplication.sharedApplication().openURL(NSString _phone)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc locationManager(manager: CLLocationManager!, didUpdateLocations: [AnyObject]!) {
        
        // centers map on users location
        userLocation = locations[0] as? CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            let (CLGeocoder *) p = userLocation;
            var title = ""
            var city = ""
            var state = ""
            var postalCode = ""
            var country = ""
    
            if (error == nil) {
                
                if p == CLPlacemark(placemark: placemarks?[0]) {
                    
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
