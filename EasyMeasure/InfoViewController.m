//
//  InfoViewController.m
//  Measure
//
//  Created by Jack on 7/14/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.straightSwitch setOn:[defaults boolForKey:@"straight"]];
    [self.metricSwitch setOn:[defaults boolForKey:@"metric"]];
    [self.voiceoverSwitch setOn:[defaults boolForKey:@"voiceover"]];

    if (![AVSpeechSynthesizer class]) {
        [self.voiceoverLabel removeFromSuperview];
        [self.voiceoverSwitch removeFromSuperview];
    }
}

- (IBAction)doneButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.metricSwitch.on forKey:@"metric"];
    [defaults setBool:self.straightSwitch.on forKey:@"straight"];
    [defaults setBool:self.voiceoverSwitch.on forKey:@"voiceover"];
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
