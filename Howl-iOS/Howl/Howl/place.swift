//
//  place.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/11/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

import UIKit
import MapKit
import WatchKit
import Foundation

var address = ""

func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
    // centers map on users location
    //userLocation = locations[0] as! CLLocation
    //var latitude = userLocation.coordinate.latitude
    //var longitude = userLocation.coordinate.longitude
    //var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    //var latDelta: CLLocationDegrees = 0.01
    //var lonDelta: CLLocationDegrees = 0.01
    
    CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
        
        var title = ""
        var city = ""
        var state = ""
        var postalCode = ""
        var country = ""
        
        if (error == nil) {
            
            if let p = placemarks?.first {
                // With Swift 2.0 we had to change how we handled the data
                // p is in an optional wrapper  cause it would b a nil value be default
                let subThoroughfare = p.subThoroughfare ?? ""
                city = p.locality ?? ""
                state = p.administrativeArea ?? ""
                postalCode = p.postalCode ?? ""
                country = p.country ?? ""
                let thoroughfare = p.thoroughfare ?? ""
                
                address = "\(title) \(city) \(state) \(postalCode) \(country)"
                title = "\(subThoroughfare) \(thoroughfare)"
                // This is what the program will outout and tell the user
                // Now we transfer data to the watch which will be handled by the ContList.h and .m
            }
        }
    })
}
func readData(){
    // This will grab the data from the sqlite database
    let emsNum = sharedInstance.ContList();
}
