//
//  StartUpViewController.m
//  Password Strength
//
//  Created by Bryan Antigua on 3/3/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "StartUpViewController.h"
#import "MainViewController.h"
#import "AutoLayoutUtil.h"
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
    [self addConstraints];
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

#pragma mark - Layout Contraints

- (void) addConstraints {
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //backgroundview constraints
    NSMutableArray *backgroundImageViewConstraints = [AutoLayoutUtil centerAndSizeToSuperViewConstraints:self.backgroundImageView];
    [self.view addConstraints:backgroundImageViewConstraints];
    
    
    //titleview contraints
    NSMutableArray *titleViewConstraints = [[NSMutableArray alloc] init];
    [titleViewConstraints addObject:[AutoLayoutUtil centerXWithSuperViewConstraint:self.titleView]];
    [titleViewConstraints addObject:[AutoLayoutUtil widthEqualToSuperViewConstraint:self.titleView]];
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
@end
