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
    @IBOutlet var stopButton: UIButton!
    
    var locationManager = CLLocationManager()
    var firstLocation = CLLocation()
    var secondLocation = CLLocation()
    var oldDistance = 0.0
    var distance = 0.0
    var firstUpdate = true
    var metric = NSUserDefaults().boolForKey("metric")
    var straight = NSUserDefaults().boolForKey("straight")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        var location: CLLocation = locations[locations.count-1] as CLLocation
        
        if -location.timestamp.timeIntervalSinceNow > 2.0 {
            return
        }
        
        if (location as AnyObject? === nil) {
            if (firstUpdate) {
                firstUpdate = false
                firstLocation = location
            } else {
                secondLocation = location
                if (straight) {
                    distance = firstLocation.distanceFromLocation(secondLocation) * (metric ? 1 : 1.0936)
                } else {
                    distance += firstLocation.distanceFromLocation(secondLocation) * (metric ? 1 : 1.0936)
                    firstLocation = location
                }
            }
        }
        
        var units = metric ? "m" : "yds"
        estimateText.text = "\(distance) \(units)."
        oldDistance = distance
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination: ResultsViewController = segue.destinationViewController as ResultsViewController
        destination.sendDistance(distance)
    }
}
