//
//  TotalConsumedTodayViewController.h
//  Stel
//
//  Created by Bryan Antigua on 5/7/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalConsumedTodayViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *progressBarView;
@property (strong, nonatomic) IBOutlet UIView *percentageBarView;
@property (strong, nonatomic) IBOutlet UIView *downArrowIndicatorView;
@property (strong, nonatomic) IBOutlet UIView *settingsButton;
@property (strong, nonatomic) IBOutlet UIView *bluetoothButton;
@property (strong, nonatomic) IBOutlet UIView *downArrowView;

@end
