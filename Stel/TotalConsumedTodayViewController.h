//
//  TotalConsumedTodayViewController.h
//  Stel
//
//  Created by Bryan Antigua on 5/7/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressBarView.h"
#import "TotalBottlesView.h"
#import "MascotUIView.h"

@interface TotalConsumedTodayViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet ProgressBarView *progressBarView;
@property (strong, nonatomic) IBOutlet MascotUIView *mascotView;
@property (strong, nonatomic) IBOutlet UILabel *amountConsumedLabel;
@property (strong, nonatomic) IBOutlet UIButton *downArrowIndicatorVButton;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIButton *bluetoothButton;
@property (strong, nonatomic) IBOutlet UIView *interestingFactView;
@property (strong, nonatomic) IBOutlet UILabel *interestingFactLabel;
@property (strong, nonatomic) IBOutlet UIImageView *interestingFactImageView;
@property (strong, nonatomic) IBOutlet TotalBottlesView *badgesView;
@property (strong, nonatomic) IBOutlet UIView *mascotSecondPositionView;

@property (assign,nonatomic) BOOL animateBadges;
@end
