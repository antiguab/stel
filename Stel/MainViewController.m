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

@interface MainViewController ()

@property BAFluidView *fluidView;
@property TotalBottlesView *bottleProgressView;

@end

@implementation MainViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bluetoothButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bluetoothButton.layer.shadowOffset = CGSizeMake(2.0f,2.0f);
    self.bluetoothButton.layer.masksToBounds = NO;
    self.bluetoothButton.layer.shadowRadius = 10.0f;
    self.bluetoothButton.layer.shadowOpacity = 0.7;
    
    self.settingsButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.settingsButton.layer.shadowOffset = CGSizeMake(2.0f,2.0f);
    self.settingsButton.layer.masksToBounds = NO;
    self.settingsButton.layer.shadowRadius = 10.0f;
    self.settingsButton.layer.shadowOpacity = 0.7;
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated{



}

-(void)viewDidLayoutSubviews {
    
    if (!self.fluidView) {
        self.fluidView = [[BAFluidView alloc] initWithFrame:self.waterBottleContainerView.bounds startElevation:@0.0];
        [self.waterBottleContainerView addSubview:self.fluidView];
        
        UIImage *maskingImage = [UIImage imageNamed:@"waterBottleImage"];
        CALayer *maskingLayer = [CALayer layer];
        maskingLayer.frame = self.waterBottleContainerView.bounds;
        maskingLayer.contents = (id)[maskingImage CGImage];
        self.waterBottleContainerView.layer.mask = maskingLayer;
        
        [self.fluidView fillTo:0.6];
        self.fluidView.fillAutoReverse = NO;
        self.fluidView.fillRepeatCount = 0;
        
        [self.fluidView startAnimation];
    }
    
    if(!self.bottleProgressView){
        self.bottleProgressView = [[TotalBottlesView alloc] initWithFrame:self.totalBottlesContainerView.bounds];
        [self.totalBottlesContainerView addSubview:self.bottleProgressView];
        [self.bottleProgressView performSelector:@selector(animateAllBottles) withObject:nil afterDelay:1.0];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
