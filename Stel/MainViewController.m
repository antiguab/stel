//
//  ViewController.m
//  Stel
//
//  Created by Bryan Antigua on 4/24/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "MainViewController.h"
#import "BAFluidView.h"
#import "TotalBottlesView.h"
#import "AutoLayoutUtil.h"

@interface MainViewController ()

@property BAFluidView *fluidView;
@property TotalBottlesView *bottleProgressView;
@property BOOL startUp;

@end

@implementation MainViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startUp = YES;
    [self addViewShadow:self.bluetoothButton];
    [self addViewShadow:self.settingsButton];
    [self addConstraints];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidLayoutSubviews {
    if (self.startUp) {
        
        [self.totalBottlesView configure];
        [self.totalBottlesView performSelector:@selector(animateAllBottles) withObject:nil afterDelay:1.0];

        [self.waterBottleView defaultConfiguration];
        [self.waterBottleView fillTo:@0.99];
        self.waterBottleView.fillAutoReverse = NO;
        self.waterBottleView.fillRepeatCount = 0;
        [self.waterBottleView startAnimation];
        UIImage *maskingImage = [UIImage imageNamed:@"waterBottleImage"];
        CALayer *maskingLayer = [CALayer layer];
        maskingLayer.frame = self.waterBottleView.bounds;
        maskingLayer.contents = (id)[maskingImage CGImage];
        self.waterBottleView.layer.mask = maskingLayer;
        
        self.startUp = NO;


    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)addViewShadow:(UIView *)view {
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(2.0f,2.0f);
    view.layer.masksToBounds = NO;
    view.layer.shadowRadius = 10.0f;
    view.layer.shadowOpacity = 0.7;
    
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
                                  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20]];
    [self.view addConstraints:bluetoothConstraints];
    
    //settings button constraints
    self.settingsButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *settingsButtonConstraints = [NSMutableArray array];
    [settingsButtonConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.bluetoothButton width:1 height:1]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeTop multiplier:1.0 constant:40]];
    [settingsButtonConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.settingsButton attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
    [self.view addConstraints:settingsButtonConstraints];
    
    //waterbottle container constraints
    self.waterBottleView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *waterBottleConstraints = [NSMutableArray array];
    [waterBottleConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.waterBottleView]];
    [waterBottleConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.waterBottleView attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:150]];
    [waterBottleConstraints addObject:[AutoLayoutUtil aspectRatioConstraint:self.waterBottleView width:1 height:3]];
    [self.view addConstraints:waterBottleConstraints];
    
    //waterbottle total container constraints
    self.totalBottlesView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *totalBottlesConstraints = [NSMutableArray array];
    [totalBottlesConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.waterBottleView]];
    [totalBottlesConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.totalBottlesView attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual toItem:self.waterBottleView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10]];
    [totalBottlesConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.totalBottlesView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100]];
    
    [totalBottlesConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.totalBottlesView attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual toItem:self.view
                                 attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
    
    [totalBottlesConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.totalBottlesView attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual toItem:self.view
                                 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20]];
    
    [totalBottlesConstraints addObject:
    [NSLayoutConstraint constraintWithItem:self.totalBottlesView attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10]];
    
    [self.view addConstraints:totalBottlesConstraints];
}

@end
