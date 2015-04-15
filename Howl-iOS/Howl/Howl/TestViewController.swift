//
//  TestViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/11/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

class TestViewController: UIViewController, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate {

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
        
        //println("vector[0] = \(buildings[0])")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //println("view did load")
        
        var array: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("emergencyNumbers")
        
        println(array)
        
        var UILongPress = UILongPressGestureRecognizer(target: self, action: "action1:")
        UILongPress.minimumPressDuration = 1.0
        view.addGestureRecognizer(UILongPress)
        
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
    
    func action1(gestureRecognizer:UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            //println("gesture")
            let phone = "tel://1111111111"
            let url:NSURL = NSURL(string:phone)!
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            //println("gesture")
            let phone = "tel://9099124128"
            let url:NSURL = NSURL(string:phone)!
            //UIApplication.sharedApplication().openURL(url)
         
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = "The emergency location is \(userLocation.coordinate.latitude) \(userLocation.coordinate.longitude) \(address) "
                controller.recipients = ["9097494909", "9099124128","9512371097"]
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
        
        //println("user location is \(userLocation)")
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            
            var title = ""
            
            var city = ""
            
            var state = ""
            
            var postalCode = ""
            
            if (error == nil) {
                
                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                    
                    var subThoroughfare:String = ""
                    var thoroughfare:String = ""
                    
                    if p.subThoroughfare != nil {
                        
                        
                        
                        subThoroughfare = p.subThoroughfare
                        
                        city = p.locality
                        
                        state = p.administrativeArea
                        
                        postalCode = p.postalCode
                        
                        
                    }
                    
                    if p.thoroughfare != nil {
                        
                        thoroughfare = p.thoroughfare
                        
                    }
                    
                    title = "\(subThoroughfare) \(thoroughfare)"
                    
                    self.address = "\(title) \(city) \(state) \(postalCode)"
                    
                    //println(self.address)
                }
                
            }
            
        })
    
    }
    
}
