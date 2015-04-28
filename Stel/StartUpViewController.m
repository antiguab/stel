//
//  StartUpViewController.m
//  Password Strength
//
//  Created by Bryan Antigua on 3/3/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "StartUpViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"

@interface StartUpViewController ()
    
    @property(strong,nonatomic) UIDynamicAnimator *animator;
    @property(strong,nonatomic) UIGravityBehavior *gravity;
    @property(strong,nonatomic) UICollisionBehavior *collision;

@end

@implementation StartUpViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews{
    [self.titleView animateTitle:^(BOOL finished) {
        [self dropTitle];
    }];
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)dropTitle {
    
    [CATransaction begin];
    CABasicAnimation *moveDown;
    moveDown = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveDown.byValue  = @250;
    moveDown.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    moveDown.duration = 1.0;
    moveDown.removedOnCompletion = NO;
    moveDown.fillMode = kCAFillModeBoth;
    [CATransaction setCompletionBlock:^{
        AppDelegate *app =(AppDelegate *)[UIApplication sharedApplication].delegate;
        [UIView transitionWithView:app.navController.view duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.navigationController pushViewController:app.mainViewController animated:NO];
        } completion:nil];
    }];
    [self.titleView.layer addAnimation:moveDown forKey:@"y"];
    [CATransaction commit];
}

@end
