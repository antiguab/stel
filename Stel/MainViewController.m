//
//  ViewController.m
//  Stel
//
//  Created by Bryan Antigua on 4/24/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidLayoutSubviews {
    BAFluidView *fluidView = [[BAFluidView alloc] initWithFrame:self.waterBottleView.bounds startElevation:@0.0];
    [fluidView fillTo:0.5];
    UIImage *maskingImage = [UIImage imageNamed:@"waterBottleImage"];
    CALayer *maskingLayer = [CALayer layer];

    maskingLayer.frame = self.waterBottleView.bounds;
    maskingLayer.contents = (id)[maskingImage CGImage];
    self.waterBottleView.layer.mask = maskingLayer;

    [self.waterBottleView addSubview:fluidView];
    
    self.waterBottleView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.waterBottleView.layer.shadowOffset = CGSizeMake(15.0f,15.0f);
    self.waterBottleView.layer.masksToBounds = NO;
    self.waterBottleView.layer.shadowRadius = 5.0f;
    self.waterBottleView.layer.shadowOpacity = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
