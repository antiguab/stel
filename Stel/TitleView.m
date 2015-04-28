//
//  TitleVIew.m
//  sketctToPaintCode
//
//  Created by Bryan Antigua on 3/2/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "TitleView.h"


@interface TitleView ()

    @property(strong,nonatomic) UIColor *textColor;
    @property(strong,nonatomic) UIBezierPath *titlePath;

@end
@implementation TitleView

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)aRect {
    self = [super initWithFrame:aRect];
    
    if (self) {
        [self configure];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configure];
    }
    
    return self;
}

- (void)configure {
    self.textColor = [UIColor whiteColor];
    [self createTitlePath];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(15.0f,15.0f);
    self.layer.masksToBounds = NO;
    self.layer.shadowRadius = 10.0f;
    self.layer.shadowOpacity = 0.7;

}

#pragma mark - Public

- (void)animateTitle:(completionBlock)compblock{
    
    //adjust to center
    CGFloat xAdjustment = CGRectGetWidth(self.frame)/2 - CGRectGetWidth(self.titlePath.bounds)/2;
    CGAffineTransform translation = CGAffineTransformMakeTranslation(xAdjustment,0);
    CGPathRef movedPath = CGPathCreateCopyByTransformingPath(self.titlePath.CGPath,&translation);
    self.titlePath.CGPath = movedPath;
    
    CAShapeLayer *titleLayer = [[CAShapeLayer alloc] init];
    titleLayer.path = self.titlePath.CGPath;
    titleLayer.strokeColor = self.textColor.CGColor;
    titleLayer.fillColor = [UIColor clearColor].CGColor;
    titleLayer.strokeStart = 0.0f;
    titleLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:titleLayer];
    
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    strokeAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    strokeAnimation.duration = 3.0f;
    strokeAnimation.beginTime = 0.0f;
    
    CABasicAnimation *fillAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillAnimation.duration = 1.0f;
    fillAnimation.beginTime = 3.0f;
    fillAnimation.toValue =  (id)[UIColor whiteColor].CGColor;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.removedOnCompletion = NO;
    group.duration = 4.0;
    group.fillMode = kCAFillModeForwards;
    
    [CATransaction begin];
    group.animations = @[strokeAnimation,fillAnimation];
    [CATransaction setCompletionBlock:^{
        compblock(YES);
    }];
    [titleLayer addAnimation:group forKey:nil];
    [CATransaction commit];

}

#pragma mark - Private

- (void)createTitlePath {
    self.titlePath = UIBezierPath.bezierPath;
    [self.titlePath moveToPoint: CGPointMake(0.81, 97.05)];
    [self.titlePath addCurveToPoint: CGPointMake(16.77, 102.79) controlPoint1: CGPointMake(6.41, 99.85) controlPoint2: CGPointMake(11.73, 101.67)];
    [self.titlePath addCurveToPoint: CGPointMake(64.79, 72.55) controlPoint1: CGPointMake(42.25, 108.81) controlPoint2: CGPointMake(64.79, 97.89)];
    [self.titlePath addCurveToPoint: CGPointMake(27.83, 37.27) controlPoint1: CGPointMake(64.79, 47.21) controlPoint2: CGPointMake(34.13, 42.03)];
    [self.titlePath addCurveToPoint: CGPointMake(24.75, 31.39) controlPoint1: CGPointMake(25.87, 35.73) controlPoint2: CGPointMake(24.75, 33.49)];
    [self.titlePath addCurveToPoint: CGPointMake(32.59, 23.55) controlPoint1: CGPointMake(24.61, 26.63) controlPoint2: CGPointMake(28.39, 24.11)];
    [self.titlePath addCurveToPoint: CGPointMake(52.61, 27.47) controlPoint1: CGPointMake(39.17, 22.85) controlPoint2: CGPointMake(47.71, 25.51)];
    [self.titlePath addCurveToPoint: CGPointMake(53.87, 24.53) controlPoint1: CGPointMake(54.57, 28.31) controlPoint2: CGPointMake(55.83, 25.37)];
    [self.titlePath addCurveToPoint: CGPointMake(32.73, 20.33) controlPoint1: CGPointMake(45.75, 21.17) controlPoint2: CGPointMake(39.45, 19.91)];
    [self.titlePath addCurveToPoint: CGPointMake(21.53, 31.81) controlPoint1: CGPointMake(26.29, 20.61) controlPoint2: CGPointMake(21.25, 25.37)];
    [self.titlePath addCurveToPoint: CGPointMake(53.45, 54.77) controlPoint1: CGPointMake(22.37, 44.55) controlPoint2: CGPointMake(39.73, 41.89)];
    [self.titlePath addCurveToPoint: CGPointMake(53.73, 92.85) controlPoint1: CGPointMake(65.35, 65.69) controlPoint2: CGPointMake(63.25, 83.19)];
    [self.titlePath addCurveToPoint: CGPointMake(2.49, 94.25) controlPoint1: CGPointMake(41.27, 105.31) controlPoint2: CGPointMake(18.59, 102.65)];
    [self.titlePath addCurveToPoint: CGPointMake(0.81, 97.05) controlPoint1: CGPointMake(0.53, 93.27) controlPoint2: CGPointMake(-1.01, 96.07)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(56.39, 4.37)];
    [self.titlePath addCurveToPoint: CGPointMake(40.85, 0.45) controlPoint1: CGPointMake(49.81, 2.13) controlPoint2: CGPointMake(44.77, 1.01)];
    [self.titlePath addCurveToPoint: CGPointMake(1.37, 32.09) controlPoint1: CGPointMake(18.31, -2.63) controlPoint2: CGPointMake(1.37, 10.39)];
    [self.titlePath addCurveToPoint: CGPointMake(38.61, 67.23) controlPoint1: CGPointMake(1.37, 58.13) controlPoint2: CGPointMake(32.03, 61.77)];
    [self.titlePath addCurveToPoint: CGPointMake(39.03, 78.29) controlPoint1: CGPointMake(41.83, 70.17) controlPoint2: CGPointMake(42.39, 75.21)];
    [self.titlePath addCurveToPoint: CGPointMake(5.15, 73.39) controlPoint1: CGPointMake(32.03, 84.73) controlPoint2: CGPointMake(13.97, 79.55)];
    [self.titlePath addCurveToPoint: CGPointMake(3.33, 76.05) controlPoint1: CGPointMake(3.47, 72.27) controlPoint2: CGPointMake(1.51, 74.79)];
    [self.titlePath addCurveToPoint: CGPointMake(32.45, 84.31) controlPoint1: CGPointMake(12.29, 82.63) controlPoint2: CGPointMake(23.63, 84.87)];
    [self.titlePath addCurveToPoint: CGPointMake(44.49, 72.69) controlPoint1: CGPointMake(39.03, 83.89) controlPoint2: CGPointMake(44.91, 79.27)];
    [self.titlePath addCurveToPoint: CGPointMake(12.85, 50.29) controlPoint1: CGPointMake(43.65, 59.81) controlPoint2: CGPointMake(26.57, 62.19)];
    [self.titlePath addCurveToPoint: CGPointMake(12.01, 12.07) controlPoint1: CGPointMake(0.81, 39.51) controlPoint2: CGPointMake(3.05, 21.73)];
    [self.titlePath addCurveToPoint: CGPointMake(55.27, 7.31) controlPoint1: CGPointMake(23.07, 0.03) controlPoint2: CGPointMake(40.29, 2.13)];
    [self.titlePath addCurveToPoint: CGPointMake(56.39, 4.37) controlPoint1: CGPointMake(57.23, 8.15) controlPoint2: CGPointMake(58.35, 5.07)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(144.73, 20.61)];
    [self.titlePath addLineToPoint: CGPointMake(119.67, 20.61)];
    [self.titlePath addCurveToPoint: CGPointMake(118.13, 22.15) controlPoint1: CGPointMake(118.83, 20.61) controlPoint2: CGPointMake(118.13, 21.31)];
    [self.titlePath addLineToPoint: CGPointMake(118.13, 102.23)];
    [self.titlePath addCurveToPoint: CGPointMake(119.67, 103.77) controlPoint1: CGPointMake(118.13, 103.07) controlPoint2: CGPointMake(118.83, 103.77)];
    [self.titlePath addCurveToPoint: CGPointMake(121.21, 102.23) controlPoint1: CGPointMake(120.51, 103.77) controlPoint2: CGPointMake(121.21, 103.07)];
    [self.titlePath addLineToPoint: CGPointMake(121.21, 23.97)];
    [self.titlePath addLineToPoint: CGPointMake(144.73, 23.97)];
    [self.titlePath addCurveToPoint: CGPointMake(146.27, 22.15) controlPoint1: CGPointMake(145.57, 23.97) controlPoint2: CGPointMake(146.27, 23.13)];
    [self.titlePath addCurveToPoint: CGPointMake(144.73, 20.61) controlPoint1: CGPointMake(146.27, 21.31) controlPoint2: CGPointMake(145.57, 20.61)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(74.73, 3.81)];
    [self.titlePath addLineToPoint: CGPointMake(144.59, 3.81)];
    [self.titlePath addCurveToPoint: CGPointMake(146.27, 2.27) controlPoint1: CGPointMake(145.57, 3.81) controlPoint2: CGPointMake(146.27, 3.11)];
    [self.titlePath addCurveToPoint: CGPointMake(144.59, 0.73) controlPoint1: CGPointMake(146.27, 1.43) controlPoint2: CGPointMake(145.57, 0.73)];
    [self.titlePath addLineToPoint: CGPointMake(74.73, 0.73)];
    [self.titlePath addCurveToPoint: CGPointMake(73.19, 2.27) controlPoint1: CGPointMake(73.89, 0.73) controlPoint2: CGPointMake(73.19, 1.43)];
    [self.titlePath addCurveToPoint: CGPointMake(74.73, 3.81) controlPoint1: CGPointMake(73.19, 3.11) controlPoint2: CGPointMake(73.89, 3.81)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(74.73, 23.97)];
    [self.titlePath addLineToPoint: CGPointMake(98.11, 23.97)];
    [self.titlePath addLineToPoint: CGPointMake(98.11, 102.23)];
    [self.titlePath addCurveToPoint: CGPointMake(99.79, 103.77) controlPoint1: CGPointMake(98.11, 103.07) controlPoint2: CGPointMake(98.81, 103.77)];
    [self.titlePath addCurveToPoint: CGPointMake(101.33, 102.23) controlPoint1: CGPointMake(100.63, 103.77) controlPoint2: CGPointMake(101.33, 103.07)];
    [self.titlePath addLineToPoint: CGPointMake(101.33, 22.15)];
    [self.titlePath addCurveToPoint: CGPointMake(99.79, 20.61) controlPoint1: CGPointMake(101.33, 21.31) controlPoint2: CGPointMake(100.63, 20.61)];
    [self.titlePath addLineToPoint: CGPointMake(74.73, 20.61)];
    [self.titlePath addCurveToPoint: CGPointMake(73.19, 22.15) controlPoint1: CGPointMake(73.89, 20.61) controlPoint2: CGPointMake(73.19, 21.31)];
    [self.titlePath addCurveToPoint: CGPointMake(74.73, 23.97) controlPoint1: CGPointMake(73.19, 23.13) controlPoint2: CGPointMake(73.89, 23.97)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(205.49, 60.51)];
    [self.titlePath addLineToPoint: CGPointMake(183.09, 60.51)];
    [self.titlePath addCurveToPoint: CGPointMake(181.41, 62.19) controlPoint1: CGPointMake(182.11, 60.51) controlPoint2: CGPointMake(181.41, 61.21)];
    [self.titlePath addLineToPoint: CGPointMake(181.41, 82.21)];
    [self.titlePath addCurveToPoint: CGPointMake(183.09, 83.75) controlPoint1: CGPointMake(181.41, 83.05) controlPoint2: CGPointMake(182.11, 83.75)];
    [self.titlePath addLineToPoint: CGPointMake(214.87, 83.75)];
    [self.titlePath addCurveToPoint: CGPointMake(216.41, 82.21) controlPoint1: CGPointMake(215.71, 83.75) controlPoint2: CGPointMake(216.41, 83.05)];
    [self.titlePath addCurveToPoint: CGPointMake(214.87, 80.53) controlPoint1: CGPointMake(216.41, 81.23) controlPoint2: CGPointMake(215.71, 80.53)];
    [self.titlePath addLineToPoint: CGPointMake(184.63, 80.53)];
    [self.titlePath addLineToPoint: CGPointMake(184.63, 63.73)];
    [self.titlePath addLineToPoint: CGPointMake(205.49, 63.73)];
    [self.titlePath addCurveToPoint: CGPointMake(207.17, 62.19) controlPoint1: CGPointMake(206.47, 63.73) controlPoint2: CGPointMake(207.17, 63.03)];
    [self.titlePath addCurveToPoint: CGPointMake(205.49, 60.51) controlPoint1: CGPointMake(207.17, 61.21) controlPoint2: CGPointMake(206.47, 60.51)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(214.87, 20.61)];
    [self.titlePath addLineToPoint: CGPointMake(183.09, 20.61)];
    [self.titlePath addCurveToPoint: CGPointMake(181.41, 22.15) controlPoint1: CGPointMake(182.11, 20.61) controlPoint2: CGPointMake(181.41, 21.31)];
    [self.titlePath addLineToPoint: CGPointMake(181.41, 42.17)];
    [self.titlePath addCurveToPoint: CGPointMake(183.09, 43.85) controlPoint1: CGPointMake(181.41, 43.01) controlPoint2: CGPointMake(182.11, 43.85)];
    [self.titlePath addLineToPoint: CGPointMake(205.49, 43.85)];
    [self.titlePath addCurveToPoint: CGPointMake(207.17, 42.17) controlPoint1: CGPointMake(206.47, 43.85) controlPoint2: CGPointMake(207.17, 43.01)];
    [self.titlePath addCurveToPoint: CGPointMake(205.49, 40.49) controlPoint1: CGPointMake(207.17, 41.33) controlPoint2: CGPointMake(206.47, 40.49)];
    [self.titlePath addLineToPoint: CGPointMake(184.63, 40.49)];
    [self.titlePath addLineToPoint: CGPointMake(184.63, 23.83)];
    [self.titlePath addLineToPoint: CGPointMake(214.87, 23.83)];
    [self.titlePath addCurveToPoint: CGPointMake(216.41, 22.15) controlPoint1: CGPointMake(215.71, 23.83) controlPoint2: CGPointMake(216.41, 23.13)];
    [self.titlePath addCurveToPoint: CGPointMake(214.87, 20.61) controlPoint1: CGPointMake(216.41, 21.31) controlPoint2: CGPointMake(215.71, 20.61)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(214.87, 100.55)];
    [self.titlePath addLineToPoint: CGPointMake(164.61, 100.55)];
    [self.titlePath addLineToPoint: CGPointMake(164.61, 3.81)];
    [self.titlePath addLineToPoint: CGPointMake(214.87, 3.81)];
    [self.titlePath addCurveToPoint: CGPointMake(216.41, 2.13) controlPoint1: CGPointMake(215.71, 3.81) controlPoint2: CGPointMake(216.41, 3.11)];
    [self.titlePath addCurveToPoint: CGPointMake(214.87, 0.59) controlPoint1: CGPointMake(216.41, 1.29) controlPoint2: CGPointMake(215.71, 0.59)];
    [self.titlePath addLineToPoint: CGPointMake(163.07, 0.59)];
    [self.titlePath addCurveToPoint: CGPointMake(161.39, 2.13) controlPoint1: CGPointMake(162.09, 0.59) controlPoint2: CGPointMake(161.39, 1.29)];
    [self.titlePath addLineToPoint: CGPointMake(161.39, 102.23)];
    [self.titlePath addCurveToPoint: CGPointMake(163.07, 103.77) controlPoint1: CGPointMake(161.39, 103.07) controlPoint2: CGPointMake(162.09, 103.77)];
    [self.titlePath addLineToPoint: CGPointMake(214.87, 103.77)];
    [self.titlePath addCurveToPoint: CGPointMake(216.41, 102.23) controlPoint1: CGPointMake(215.71, 103.77) controlPoint2: CGPointMake(216.41, 103.07)];
    [self.titlePath addCurveToPoint: CGPointMake(214.87, 100.55) controlPoint1: CGPointMake(216.41, 101.25) controlPoint2: CGPointMake(215.71, 100.55)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(294.95, 100.55)];
    [self.titlePath addLineToPoint: CGPointMake(238.39, 100.55)];
    [self.titlePath addLineToPoint: CGPointMake(238.39, 2.13)];
    [self.titlePath addCurveToPoint: CGPointMake(236.71, 0.59) controlPoint1: CGPointMake(238.39, 1.29) controlPoint2: CGPointMake(237.69, 0.59)];
    [self.titlePath addCurveToPoint: CGPointMake(235.17, 2.13) controlPoint1: CGPointMake(235.87, 0.59) controlPoint2: CGPointMake(235.17, 1.29)];
    [self.titlePath addLineToPoint: CGPointMake(235.17, 102.23)];
    [self.titlePath addCurveToPoint: CGPointMake(236.71, 103.77) controlPoint1: CGPointMake(235.17, 103.07) controlPoint2: CGPointMake(235.87, 103.77)];
    [self.titlePath addLineToPoint: CGPointMake(294.95, 103.77)];
    [self.titlePath addCurveToPoint: CGPointMake(296.63, 102.23) controlPoint1: CGPointMake(295.93, 103.77) controlPoint2: CGPointMake(296.63, 103.07)];
    [self.titlePath addCurveToPoint: CGPointMake(294.95, 100.55) controlPoint1: CGPointMake(296.63, 101.25) controlPoint2: CGPointMake(295.93, 100.55)];
    [self.titlePath closePath];
    [self.titlePath moveToPoint: CGPointMake(255.05, 2.13)];
    [self.titlePath addLineToPoint: CGPointMake(255.05, 82.21)];
    [self.titlePath addCurveToPoint: CGPointMake(256.73, 83.75) controlPoint1: CGPointMake(255.05, 83.05) controlPoint2: CGPointMake(255.89, 83.75)];
    [self.titlePath addLineToPoint: CGPointMake(294.95, 83.75)];
    [self.titlePath addCurveToPoint: CGPointMake(296.63, 82.21) controlPoint1: CGPointMake(295.93, 83.75) controlPoint2: CGPointMake(296.63, 83.05)];
    [self.titlePath addCurveToPoint: CGPointMake(294.95, 80.53) controlPoint1: CGPointMake(296.63, 81.23) controlPoint2: CGPointMake(295.93, 80.53)];
    [self.titlePath addLineToPoint: CGPointMake(258.41, 80.53)];
    [self.titlePath addLineToPoint: CGPointMake(258.41, 2.13)];
    [self.titlePath addCurveToPoint: CGPointMake(256.73, 0.59) controlPoint1: CGPointMake(258.41, 1.29) controlPoint2: CGPointMake(257.57, 0.59)];
    [self.titlePath addCurveToPoint: CGPointMake(255.05, 2.13) controlPoint1: CGPointMake(255.89, 0.59) controlPoint2: CGPointMake(255.05, 1.29)];
    [self.titlePath closePath];
}

@end
