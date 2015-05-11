//
//  TotalConsumedTodayViewController.m
//  Stel
//
//  Created by Bryan Antigua on 5/7/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "TotalConsumedTodayViewController.h"
#import "AutoLayoutUtil.h"

@interface TotalConsumedTodayViewController ()

@end

@implementation TotalConsumedTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addConstraints];
    
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    NSLog(@"scrollview frame: %@", NSStringFromCGRect(self.scrollView.frame));
    NSLog(@" frame: %@", NSStringFromCGRect(self.view.frame));

    NSLog(@"scrollview content size: %@", NSStringFromCGSize(self.scrollView.contentSize));
    NSLog(@"contentView frame: %@", NSStringFromCGRect(self.contentView.frame));
//    self.contentView.backgroundColor = [UIColor yellowColor];
    NSLog(@"progressBar frame: %@", NSStringFromCGRect(self.progressBarView.frame));

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
     [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:3.0 constant:0.0]];
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
    
    //percentageBarView contraints
    self.percentageBarView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *percentageConstraints = [NSMutableArray array];
    [percentageConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.percentageBarView]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.percentageBarView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.progressBarView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.percentageBarView attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.percentageBarView.superview
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.percentageBarView attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.percentageBarView.superview
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [percentageConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.percentageBarView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100]];
 
    [self.view addConstraints:percentageConstraints];
    
    //bluetooth button constraints
    self.bluetoothButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *bluetoothConstraints = [NSMutableArray array];
    [bluetoothConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.bluetoothButton width:1 height:1]];
    [bluetoothConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.bluetoothButton attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:40]];
    [bluetoothConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.bluetoothButton attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
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
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:40]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:self.bluetoothButton
                                  attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraints:settingsButtonConstraints];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGFloat maxOffset = self.contentView.frame.size.height*(2.0/3.0); // we strat offset at the top not bottom
    self.blurView.alpha = (1 - offset.y/maxOffset);

}

@end
