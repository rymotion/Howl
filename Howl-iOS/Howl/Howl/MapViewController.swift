//
//  MapViewController.swift
//  Howl
//
//  Created by Mbusi Hlatshwayo on 4/6/15.
//  Copyright (c) 2015 Ryan Paglinawan. All rights reserved.
//

//
//  ViewController.swift
//  MemorablePlaces
//
//  Created by Mbusi Hlatshwayo on 3/16/15.
//  Copyright (c) 2015 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import MapKit
import WatchKit

var userLocation = CLLocation()

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var manager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create location manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    @objc func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]) {
        
        
        // centers map on users location
        userLocation = locations[0] as! CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        print("user location is \(userLocation)")
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
        
    }
    
}