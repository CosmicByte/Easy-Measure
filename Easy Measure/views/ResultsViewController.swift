//
//  ResultsViewController.swift
//  Easy Measure
//
//  Created by Jack Cook on 6/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import UIKit
import AVFoundation

class ResultsViewController: UIViewController {

    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var distance: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceLabel.text = "approximately \(distance) " + (defaults.boolForKey(metric) ? "m." : "yds.") + "."
        
        if defaults.boolForKey("voiceover") {
            var utterance: AVSpeechUtterance = AVSpeechUtterance(string: "The distance measured was approximately \(distance) " + (defaults.boolForKey(metric) ? "meters." : "yards."))
            utterance.rate = 0.02
            var synthesizer = AVSpeechSynthesizer()
            synthesizer.speakUtterance(utterance)
        }
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
