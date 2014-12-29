//
//  MenuViewController.h
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import "MeasuringViewController.h"

@interface MenuViewController : UIViewController<CLLocationManagerDelegate>

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL locationReceived;

- (IBAction)measureDistance:(id)sender;

@end
