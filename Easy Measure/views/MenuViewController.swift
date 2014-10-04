//
//  MenuViewController.swift
//  Easy Measure
//
//  Created by Jack Cook on 6/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import UIKit
import CoreLocation

class MenuViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var measureButton: UIButton!
    @IBOutlet var infoButton: UIButton!
    
    var locationReceived = false
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if !defaults.boolForKey("firstLaunch") {
            defaults.setBool(true, forKey:"firstLaunch")
            defaults.setBool(false, forKey:"metric")
            defaults.setBool(true, forKey:"straight")
            defaults.setBool(false, forKey:"voiceover")
            defaults.synchronize()
        }
        
        navigationController?.navigationBarHidden = true
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationReceived = true
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        locationReceived = false
    }
    
    @IBAction func measureDistance(sender: AnyObject) {
        if locationReceived {
            self.performSegueWithIdentifier("measuringSegue", sender:self)
        } else {
            let alert = UIAlertController(title:"Enable GPS", message:"Easy Measure has been denied access to your current location. To use the app, turn it on at Settings > Privacy > Location > Measure", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler:nil))
            presentViewController(alert, animated:true, completion:nil)
        }
    }
}