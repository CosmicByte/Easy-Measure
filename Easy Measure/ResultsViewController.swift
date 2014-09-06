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
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceLabel.text = "approximately \(distance) yds."
        
        if defaults.boolForKey("voiceover") {
            var utterance: AVSpeechUtterance = AVSpeechUtterance(string: "The distance measured was approximately \(distance) " + (defaults.boolForKey("metric") ? "meters." : "yards."))
            utterance.rate = 0.02
            var synthesizer = AVSpeechSynthesizer()
            synthesizer.speakUtterance(utterance)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var moveUp = 568 - UIScreen.mainScreen().bounds.height
        doneButton.frame = CGRectMake(doneButton.frame.origin.x, doneButton.frame.origin.y - moveUp, doneButton.frame.size.width, doneButton.frame.size.height)
    }
    
    func sendDistance(sentDistance: Double) {
        distance = sentDistance
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
