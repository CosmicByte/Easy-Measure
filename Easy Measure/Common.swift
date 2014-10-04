//
//  Common.swift
//  Easy Measure
//
//  Created by Jack Cook on 10/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import Foundation
import UIKit

var defaults = NSUserDefaults.standardUserDefaults()
var device = UIScreen.mainScreen().bounds


// Properties can't be used here because they won't update when the default is updated

func metric() -> Bool {
    return defaults.boolForKey("metric")
}

func straight() -> Bool {
    return defaults.boolForKey("straight")
}

func voiceover() -> Bool {
    return defaults.boolForKey("voiceover")
}