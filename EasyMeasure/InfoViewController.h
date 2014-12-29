//
//  InfoViewController.h
//  Measure
//
//  Created by Jack on 7/14/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *metricSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *straightSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *voiceoverSwitch;
@property (strong, nonatomic) IBOutlet UILabel *voiceoverLabel;
- (IBAction)doneButton:(id)sender;

@end
