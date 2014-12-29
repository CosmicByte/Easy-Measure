//
//  MeasuringViewController.h
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ResultsViewController.h"

@interface MeasuringViewController : UIViewController<CLLocationManagerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *estimateText;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *firstLocation;
@property (strong, nonatomic) CLLocation *secondLocation;
@property (nonatomic) double oldDistance;
@property (nonatomic) double distance;
@property (nonatomic) BOOL firstUpdate;
@property (nonatomic) BOOL metric;
@property (nonatomic) BOOL straight;

@end
