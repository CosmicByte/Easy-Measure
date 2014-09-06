//
//  InfoViewController.swift
//  Easy Measure
//
//  Created by Jack Cook on 6/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import UIKit
import AVFoundation

class InfoViewController: UIViewController {

    @IBOutlet var metricSwitch: UISwitch
    @IBOutlet var straightSwitch: UISwitch
    @IBOutlet var voiceoverSwitch: UISwitch
    
    @IBOutlet var doneButton: UIButton
    @IBOutlet var disclaimerOne: UILabel
    @IBOutlet var disclaimerTwo: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        straightSwitch.setOn(defaults.boolForKey("straight"), animated:false)
        metricSwitch.setOn(defaults.boolForKey("metric"), animated:false)
        voiceoverSwitch.setOn(defaults.boolForKey("voiceover"), animated:false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var moveUp = 568 - UIScreen.mainScreen().bounds.height
        doneButton.frame = CGRectMake(doneButton.frame.origin.x, doneButton.frame.origin.y - moveUp, doneButton.frame.size.width, doneButton.frame.size.height)
        disclaimerOne.frame = CGRectMake(disclaimerOne.frame.origin.x, disclaimerOne.frame.origin.y - moveUp, disclaimerOne.frame.size.width, disclaimerOne.frame.size.height)
        disclaimerTwo.frame = CGRectMake(disclaimerTwo.frame.origin.x, disclaimerTwo.frame.origin.y - moveUp, disclaimerTwo.frame.size.width, disclaimerTwo.frame.size.height)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(metricSwitch.on, forKey:"metric")
        defaults.setBool(straightSwitch.on, forKey:"straight")
        defaults.setBool(voiceoverSwitch.on, forKey:"voiceover")
        defaults.synchronize()
        navigationController.popViewControllerAnimated(true)
    }
}
