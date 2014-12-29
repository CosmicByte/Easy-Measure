//
//  MeasuringViewController.m
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import "MeasuringViewController.h"

@interface MeasuringViewController ()

@end

@implementation MeasuringViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.firstUpdate = YES;
    self.metric = [[NSUserDefaults standardUserDefaults] boolForKey:@"metric"];
    self.straight = [[NSUserDefaults standardUserDefaults] boolForKey:@"straight"];

    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];

    if (-[location.timestamp timeIntervalSinceNow] > 2.0) {
        return;
    }

    if (location != nil) {
        if (self.straight) {
            if (self.firstUpdate) {
                self.firstUpdate = NO;
                self.firstLocation = location;
                self.distance = 0.0;
            } else {
                self.secondLocation = location;
                self.distance = [self.firstLocation distanceFromLocation:self.secondLocation];
            }
        } else {
            if (self.firstUpdate) {
                self.firstUpdate = NO;
                self.firstLocation = location;
                self.distance = 0.0;
            } else {
                self.secondLocation = location;
                self.distance += [self.firstLocation distanceFromLocation:self.secondLocation];
                self.firstLocation = location;
            }
        }
    }
    self.estimateText.text = [NSString stringWithFormat:@"%.2f %s", self.distance, (self.metric ? "m." : "yds.")];
    self.oldDistance = self.distance;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ResultsViewController *destination = segue.destinationViewController;
    [destination sendDistance:self.distance];
}

@end