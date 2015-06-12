//
//  ProgressBarView.m
//  Stel
//
//  Created by Bryan Antigua on 5/11/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "ProgressBarView.h"
#import "BAFluidView.h"
#import "Util.h"
@interface ProgressBarView ()

@property (strong,nonatomic) CAShapeLayer *centerCircle;
@property (strong,nonatomic) CAShapeLayer *currentProgressBar;
@property (strong,nonatomic) CAShapeLayer *recommendedProgressBar;

@end
@implementation ProgressBarView

#pragma mark - Lifecycle

- (void)configure {
    [super layoutIfNeeded];
    
    self.centerCircle = [[CAShapeLayer alloc] init];
    self.centerCircle.backgroundColor = [UIColor whiteColor].CGColor;
    CGRect frame = CGRectMake( 0, 0, CGRectGetWidth(self.frame)*.6, CGRectGetHeight(self.frame)*.6);
    self.centerCircle.frame = frame;
    self.centerCircle.cornerRadius = CGRectGetHeight(self.centerCircle.frame)/2;

    self.centerCircle.position = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    self.centerCircle.transform = CATransform3DMakeScale(0, 0, 1);
    [self.layer addSublayer:self.centerCircle];
    [self animateCenterCircle];
    
    
    
}

- (void)animateCenterCircle {
    CABasicAnimation *growAnimation;
    growAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    growAnimation.duration=0.4;
    growAnimation.beginTime = 0.0;
    growAnimation.fromValue = @0.0;
    growAnimation.toValue= @1.2;
    growAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *shrinkToSizeAnimation;
    shrinkToSizeAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrinkToSizeAnimation.duration=.1;
    shrinkToSizeAnimation.beginTime = growAnimation.duration;
    shrinkToSizeAnimation.fromValue= @1.2;
    shrinkToSizeAnimation.toValue = @1.0;
    shrinkToSizeAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setDuration:growAnimation.duration + shrinkToSizeAnimation.duration];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.animations = @[growAnimation,shrinkToSizeAnimation];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        BAFluidView *fluidView = [[BAFluidView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)*.6, CGRectGetHeight(self.frame)*.6)];
        fluidView.layer.position = self.centerCircle.position;
        fluidView.layer.cornerRadius = CGRectGetHeight(fluidView.frame)/2;
        [self addSubview:fluidView];
        [fluidView initialize];
        fluidView.fillAutoReverse = NO;
        fluidView.fillRepeatCount = 0;
        [fluidView fillTo:@1.0];
        [fluidView startAnimation];
        
        self.currentProgressBar = [CAShapeLayer layer];
        self.currentProgressBar.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(fluidView.center.x, fluidView.center.y) radius:fluidView.frame.size.width/2 startAngle:2*M_PI*0-M_PI_2 endAngle:(2*M_PI*1-M_PI_2)*.6 clockwise:YES].CGPath;
        self.currentProgressBar.fillColor=[UIColor clearColor].CGColor;
        self.currentProgressBar.strokeColor=[UIColor greenColor].CGColor;
        self.currentProgressBar.lineWidth=30;
        
        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration=1.5;
        animation.removedOnCompletion=NO;
        animation.fromValue=@(0);
        animation.toValue=@(1);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer insertSublayer:self.currentProgressBar below:self.centerCircle];
        [self.currentProgressBar addAnimation:animation forKey:@"drawCircleAnimation"];
        
        self.recommendedProgressBar = [CAShapeLayer layer];
        self.recommendedProgressBar.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(fluidView.center.x, fluidView.center.y) radius:fluidView.frame.size.width/2 startAngle:2*M_PI*0-M_PI_2 endAngle:(2*M_PI*1-M_PI_2)*.8 clockwise:YES].CGPath;
        self.recommendedProgressBar.fillColor=[UIColor clearColor].CGColor;
        self.recommendedProgressBar.strokeColor=[Util UIColorFromHex:0x2c3e50].CGColor;
        self.recommendedProgressBar.lineWidth=50;

        animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration=2;
        animation.removedOnCompletion=NO;
        animation.fromValue=@(0);
        animation.toValue=@(1);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer insertSublayer:self.recommendedProgressBar below:self.currentProgressBar];
        [self.recommendedProgressBar addAnimation:animation forKey:@"drawCircleAnimation"];
    }];
    [self.centerCircle addAnimation:group forKey:@"introAnimation"];
    [CATransaction commit];
}

@end
