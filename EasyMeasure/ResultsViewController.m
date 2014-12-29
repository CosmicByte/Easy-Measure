//
//  ResultsViewController.m
//  Measure
//
//  Created by Jack on 7/12/13.
//  Copyright (c) 2013 CosmicByte. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    double distance = self.distance;
    self.distanceLabel.text = [[NSString alloc] initWithFormat:@"approximately %.2f %@", distance, [[NSUserDefaults standardUserDefaults] boolForKey:@"metric"] ? @"m." : @"yds."];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"voiceover"] && [AVSpeechSynthesizer class]) {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"The distance measured was approximately %.02f %@.", distance, [[NSUserDefaults standardUserDefaults] boolForKey:@"metric"] ? @"m." : @"yds."]];
        [utterance setRate:0.35];
        AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
        [synth speakUtterance:utterance];
    }
}

- (void)sendDistance:(double)distance {
    self.distance = distance;
}

- (IBAction)doneButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
