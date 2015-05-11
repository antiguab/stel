//
//  ViewController.h
//  Stel
//
//  Created by Bryan Antigua on 4/24/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAFluidView.h"
#import "TotalBottlesView.h"

typedef void(^completionBlock)(BOOL finished);

@interface CurrentBottleStatusViewController : UIViewController

@property (strong, nonatomic) IBOutlet BAFluidView *waterBottleView;
@property (strong, nonatomic) IBOutlet TotalBottlesView *totalBottlesView;
@property (strong, nonatomic) IBOutlet UIButton *bluetoothButton;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)SettingsButtonPressed:(id)sender;
@end

