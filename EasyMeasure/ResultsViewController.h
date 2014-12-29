//
//  ResultsViewController.h
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ResultsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
- (void)sendDistance:(double)distance;
@property (nonatomic) double distance;
- (IBAction)doneButton:(id)sender;

@end
