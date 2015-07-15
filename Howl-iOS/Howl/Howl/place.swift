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
                address = "\(title) \(city) \(state) \(postalCode) \(country)"
            }
        }
    })
}
}
