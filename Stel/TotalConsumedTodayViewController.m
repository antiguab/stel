//
//  TotalConsumedTodayViewController.m
//  Stel
//
//  Created by Bryan Antigua on 5/7/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "TotalConsumedTodayViewController.h"
#import "BAFluidView.h"
#import "AutoLayoutUtil.h"

@interface TotalConsumedTodayViewController ()

@property (assign, nonatomic) bool initialLayout;
@end

@implementation TotalConsumedTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addConstraints];
    
    [self addViewShadow:self.bluetoothButton];
    [self addViewShadow:self.settingsButton];
    
    self.scrollView.delegate = self;
    self.initialLayout = YES;
    self.animateBadges = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.initialLayout) {
        self.initialLayout = NO;

        [self.progressBarView performSelector:@selector(configure) withObject:nil afterDelay:1.0];
        [self.badgesView configure];

        [self.mascotSecondPositionView layoutIfNeeded];
        BAFluidView *fluidView = [[BAFluidView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mascotSecondPositionView.frame), CGRectGetHeight(self.mascotSecondPositionView.frame))];
        [self.mascotSecondPositionView addSubview:fluidView];
        [fluidView initialize];
        fluidView.fillAutoReverse = NO;
        fluidView.fillRepeatCount = 0;
        [fluidView fillTo:@0.9];
        [fluidView startAnimation];
        
        [self.mascotView configure];

        [NSTimer scheduledTimerWithTimeInterval:3.0
                                                      target:self.mascotView
                                                    selector:@selector(updateHydrationAnimation)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

#pragma mark - Layout Contraints

- (void) addConstraints {
    //backgroundview constraints
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *backgroundImageViewConstraints = [AutoLayoutUtil centerAndSizeToSuperViewConstraints:self.backgroundImageView];
    [self.view addConstraints:backgroundImageViewConstraints];
    
    //blurView constraints
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *blurViewConstraints = [AutoLayoutUtil centerAndSizeToSuperViewConstraints:self.blurView];
    [self.view addConstraints:blurViewConstraints];
    
 
    //contentView contraints
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *contentViewConstraints =  [NSMutableArray array];
    [contentViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [contentViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [contentViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
    [contentViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:2.0 constant:0.0]];
    [self.view addConstraints:contentViewConstraints];
    
    //scrollview contraints
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *scrollViewConstraints = [AutoLayoutUtil centerAndSizeToSuperViewConstraints:self.scrollView];
    [self.view addConstraints:scrollViewConstraints];
    [self.scrollView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.scrollView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    //progressBarView contraints
    self.progressBarView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *progressBarContraints = [NSMutableArray array];
    [progressBarContraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.progressBarView width:1 height:1]];

    [progressBarContraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.progressBarView]];
    [progressBarContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.progressBarView attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [progressBarContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.progressBarView attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [progressBarContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.progressBarView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView.superview
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:CGRectGetMaxY(self.bluetoothButton.frame) + 8]];
    
    [self.progressBarView.superview addConstraints:progressBarContraints];
    
    
    //mascotView contraints
    self.mascotView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *mascotViewContraints = [NSMutableArray array];
    [mascotViewContraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.mascotView width:1 height:1]];
    
    [mascotViewContraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.mascotView]];
    [mascotViewContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotView attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView
                                  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [mascotViewContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotView attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView
                                  attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [mascotViewContraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView
                                  attribute:NSLayoutAttributeHeight multiplier:0.7 constant:0]];
    
    [self.mascotView.superview addConstraints:mascotViewContraints];
    
    //percentageBarView contraints
    self.amountConsumedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *percentageConstraints = [NSMutableArray array];
    [percentageConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.amountConsumedLabel]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.amountConsumedLabel attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.amountConsumedLabel attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.amountConsumedLabel.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.amountConsumedLabel attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.amountConsumedLabel.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.amountConsumedLabel attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100]];
 
    [self.view addConstraints:percentageConstraints];
    
    //bluetooth button constraints
    self.bluetoothButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *bluetoothConstraints = [NSMutableArray array];
    [bluetoothConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.bluetoothButton width:1 height:1]];
    [bluetoothConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.bluetoothButton attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.bluetoothButton.superview
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:50]];
    [bluetoothConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.bluetoothButton attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.bluetoothButton.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [bluetoothConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.bluetoothButton attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeHeight multiplier:0.0 constant:self.bluetoothButton.frame.size.height]];
    [self.view addConstraints:bluetoothConstraints];
    
    //settings button constraints
    self.settingsButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *settingsButtonConstraints = [NSMutableArray array];
    [settingsButtonConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.settingsButton width:1 height:1]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.settingsButton.superview
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:50]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.settingsButton.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:self.bluetoothButton
                                  attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraints:settingsButtonConstraints];
    
    //down arrow indicatior constraints
    self.downArrowIndicatorVButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *downArrowIndicatorConstraints = [NSMutableArray array];
    [downArrowIndicatorConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.downArrowIndicatorVButton width:1 height:1]];
    [downArrowIndicatorConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.downArrowIndicatorVButton attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.amountConsumedLabel
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:16]];
    [downArrowIndicatorConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.downArrowIndicatorVButton attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:self.downArrowIndicatorVButton.frame.size.height]];
    [downArrowIndicatorConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.downArrowIndicatorVButton]];
    [self.view addConstraints:downArrowIndicatorConstraints];
    
    //badgesView contraints
    self.badgesView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *badgesViewConstraints = [NSMutableArray array];
    [badgesViewConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.badgesView]];
    [badgesViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.badgesView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.downArrowIndicatorVButton
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:40]];
    [badgesViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.badgesView attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.badgesView.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [badgesViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.badgesView attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.badgesView.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [badgesViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.badgesView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:CGRectGetHeight(self.badgesView.frame)]];
    [self.view addConstraints:badgesViewConstraints];
    
    //interestingFactView contraints
    self.interestingFactView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *interestingFactViewConstraints = [NSMutableArray array];
    [interestingFactViewConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.interestingFactView]];
    [interestingFactViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactView attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:self.mascotSecondPositionView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30]];
    [interestingFactViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactView attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactView.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [interestingFactViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactView attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactView.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [interestingFactViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:CGRectGetHeight(self.interestingFactView.frame)]];
    
    [self.view addConstraints:interestingFactViewConstraints];
    
    //interstingFactLabel constraints
    self.interestingFactLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *interestingFactLabelConstraints = [NSMutableArray array];
    [interestingFactLabelConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.interestingFactLabel]];
    [interestingFactLabelConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactLabel attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:CGRectGetHeight(self.interestingFactLabel.frame)]];
    [interestingFactLabelConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactLabel attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactLabel.superview
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:40]];
    [interestingFactLabelConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactLabel attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactLabel.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [interestingFactLabelConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactLabel attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactLabel.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.interestingFactView addConstraints:interestingFactLabelConstraints];
    
    
    //interestingFactsImageView contraints
    self.interestingFactImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *interestingFactImageViewConstraints = [NSMutableArray array];
    [interestingFactImageViewConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.interestingFactImageView]];
    [interestingFactImageViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.interestingFactImageView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.interestingFactLabel
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:16]];
    [self.interestingFactView addConstraints:interestingFactImageViewConstraints];

    
    //mascotSecondPositionView contraints
    self.mascotSecondPositionView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *mascotSecondPositionViewConstraints = [NSMutableArray array];
    [mascotSecondPositionViewConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.mascotSecondPositionView]];
    [mascotSecondPositionViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotSecondPositionView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.badgesView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8]];
    [mascotSecondPositionViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotSecondPositionView attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.mascotSecondPositionView.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [mascotSecondPositionViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotSecondPositionView attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.mascotSecondPositionView.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [mascotSecondPositionViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.mascotSecondPositionView attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self.view addConstraints:mascotSecondPositionViewConstraints];

}

- (void)addViewShadow:(UIView *)view {
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(2.0f,2.0f);
    view.layer.masksToBounds = NO;
    view.layer.shadowRadius = 10.0f;
    view.layer.shadowOpacity = 0.7f;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGFloat maxOffset = self.contentView.frame.size.height*(2.0/3.0*0.5); // we start offset at the top not bottom
    self.blurView.alpha = (1.0 - offset.y/maxOffset);
    if(offset.y/maxOffset > 0.47 && self.animateBadges){
        [self.badgesView animateAllBottles];
        self.animateBadges = NO;
    }
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
