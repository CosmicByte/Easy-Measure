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

    @IBOutlet var metricSwitch: UISwitch!
    @IBOutlet var straightSwitch: UISwitch!
    @IBOutlet var voiceoverSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        straightSwitch.setOn(straight(), animated: false)
        metricSwitch.setOn(metric(), animated: false)
        voiceoverSwitch.setOn(voiceover(), animated: false)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        defaults.setBool(metricSwitch.on, forKey: "metric")
        defaults.setBool(straightSwitch.on, forKey: "straight")
        defaults.setBool(voiceoverSwitch.on, forKey: "voiceover")
        self.navigationController?.popViewControllerAnimated(true)
    }
}
