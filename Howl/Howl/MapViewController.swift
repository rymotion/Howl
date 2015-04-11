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

var places = [Dictionary<String, String>()]

var activePlace = -1 // no active place
/*
// this was for my project held table of users previous locations
class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if places.count == 1 {
            places.removeAtIndex(0)
            places.append(["name":"Taj Mahal", "lat": "27.175277", "lon":"78.042128"])
        }
        
    }
    
*/

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var manager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create location manager
        manager = CLLocationManager()
        manager.delegate = self
        // retrieves most accurate user location drains battery
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        if (activePlace == -1) {
            
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
        } else {
            
            // there is an activePlace get the location of the users activePlace
            let latitude = NSString(string:  places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string:  places[activePlace]["lon"]!).doubleValue
            var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            var latDelta: CLLocationDegrees = 0.01
            var lonDelta: CLLocationDegrees = 0.01
            
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            var region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            
            self.map.setRegion(region, animated: true)
            
            var annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            
            annotation.title = places[activePlace]["name"]
            
            self.map.addAnnotation(annotation)
            
        }
        
        
        // creates the long press recognizer
        var UILongPress = UILongPressGestureRecognizer(target: self, action: "action:")
        UILongPress.minimumPressDuration = 2.0
        
        map.addGestureRecognizer(UILongPress)
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            
            var touchPoint = gestureRecognizer.locationInView(self.map)
            
            var newCoordinate = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                
                var title = ""
                
                if (error == nil) {
                    
                    if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                        
                        
                        
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if p.subThoroughfare != nil {
                            
                            subThoroughfare = p.subThoroughfare
                            
                        }
                        
                        if p.thoroughfare != nil {
                            
                            thoroughfare = p.thoroughfare
                            
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"
                        
                        
                    }
                    
                }
                
                if title == "" {
                    
                    title = "Added \(NSDate())"
                    
                }
                
                
                places.append(["name":title,"lat":"\(newCoordinate.latitude)","lon":"\(newCoordinate.longitude)"])
                
                var annotation = MKPointAnnotation()
                
                annotation.coordinate = newCoordinate
                
                annotation.title = title
                
                self.map.addAnnotation(annotation)
                
                
            })
            
            
            
        }
        
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        
        // centers map on users location
        var userLocation: CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
        
    }
    
}