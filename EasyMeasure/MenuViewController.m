//
//  MenuViewController.m
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];

    self.motionManager = [[CMMotionManager alloc] init];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"firstLaunch"]) {
        [defaults setBool:YES forKey:@"firstLaunch"];
        [defaults setBool:NO forKey:@"metric"];
        [defaults setBool:YES forKey:@"straight"];
        [defaults setBool:NO forKey:@"voiceover"];
        [defaults synchronize];
    }

    self.navigationController.navigationBarHidden = YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.locationReceived = YES;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.locationReceived = NO;
}

- (IBAction)measureDistance:(id)sender {
    if (self.locationReceived) {
        [self performSegueWithIdentifier:@"measuringSegue" sender:self];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enable GPS" message:@"EasyMeasure has been denied access to your current location. To use the app, turn it on at Settings > Privacy > Location > EasyMeasure" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
