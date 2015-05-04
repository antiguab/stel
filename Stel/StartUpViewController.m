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
    @property(assign,nonatomic) bool firstTime;

@end

@implementation StartUpViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTime = YES;
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleView.translatesAutoresizingMaskIntoConstraints = NO;
    //backgroundview constraints
    NSMutableArray *backgroundImageViewConstraints = [[NSMutableArray alloc] init];
    
    [backgroundImageViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [backgroundImageViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [backgroundImageViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [backgroundImageViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    [self.view addConstraints:backgroundImageViewConstraints];
    
    
    //titleview contraints
    NSMutableArray *titleViewConstraints = [[NSMutableArray alloc] init];
    
    [titleViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.titleView attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [titleViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.titleView attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [titleViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.titleView attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                  attribute:NSLayoutAttributeHeight multiplier:0.0 constant:self.titleView.frame.size.height]];
    [titleViewConstraints addObject:
     [NSLayoutConstraint constraintWithItem:self.titleView attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:self.view
                                  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30]];
    [self.view addConstraints:titleViewConstraints];
}
- (void)viewDidLayoutSubviews{

    if (self.firstTime) {
        [self.titleView animateTitle:^(BOOL finished) {
                    [self dropTitle];
        }];
        self.firstTime = NO;
    }
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
