//
//  MeasuringViewController.swift
//  Easy Measure
//
//  Created by Jack Cook on 6/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import UIKit
import CoreLocation

class MeasuringViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var estimateText: UILabel!
    
    var locationManager = CLLocationManager()
    var location = CLLocation()
    var distance = 0.0
    var firstUpdate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        var newLocation: CLLocation = locations[locations.count-1] as CLLocation
        
        if -newLocation.timestamp.timeIntervalSinceNow > 2.0 {
            return
        }
        
        if (firstUpdate) {
            firstUpdate = false
            location = newLocation
        } else {
            var newDistance = location.distanceFromLocation(newLocation) * (defaults.boolForKey(metric) ? 1 : 1.0936)
            if (defaults.boolForKey(straight)) {
                distance = newDistance
            } else {
                distance += newDistance
                location = newLocation
            }
        }
        
        estimateText.text = "\(distance) " + (defaults.boolForKey(metric) ? "m" : "yds") + "."
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination: ResultsViewController = segue.destinationViewController as ResultsViewController
        destination.distance = distance
    }
}
