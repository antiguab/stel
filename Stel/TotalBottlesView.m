//
//  TotalBottlesView.m
//  testloadbar
//
//  Created by Bryan Antigua on 4/27/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "TotalBottlesView.h"

@interface TotalBottlesView()

@property(strong,nonatomic) NSArray *bottlesArray;

@end
@implementation TotalBottlesView

#pragma mark - Lifecycle

-(void)configure{
    NSMutableArray *tempBottlesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 9; j++) {
            CGRect frame = CGRectMake(j*CGRectGetWidth(self.frame)/8, i*CGRectGetHeight(self.frame)/8 + 8, CGRectGetWidth(self.frame)/8, CGRectGetHeight(self.frame)/8);
            CAShapeLayer *bottle = [[CAShapeLayer alloc] init];
            bottle.backgroundColor = [UIColor whiteColor].CGColor;
            bottle.frame = frame;
            
            UIImage *maskingImage = [UIImage imageNamed:@"waterBottleWhiteWholeImage"];
            CALayer *maskingLayer = [CALayer layer];
            
            maskingLayer.frame = bottle.bounds;
            maskingLayer.transform = CATransform3DMakeScale(0.7, 1.0, 1.0);
            
            maskingLayer.contents = (id)[maskingImage CGImage];
            bottle.mask = maskingLayer;
            
            bottle.opacity = 0.0f;
            [tempBottlesArray addObject:bottle];
        }
    }
    
    self.bottlesArray = [NSArray arrayWithArray:tempBottlesArray];
    
}


#pragma mark - Public

- (void)animateAllBottles {
    for (int i = 0; i < self.bottlesArray.count; i++) {

        CAShapeLayer *bottle = self.bottlesArray[i];
        CGFloat startingPoint = (i*.05);

        CABasicAnimation *opacityAnimation;
        opacityAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.duration=0.0;
        opacityAnimation.beginTime = startingPoint;
        opacityAnimation.fromValue = @1.0;
        opacityAnimation.toValue= @1.0;
        opacityAnimation.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *growAnimation;
        growAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        growAnimation.duration=.1;
        growAnimation.beginTime = startingPoint;
        growAnimation.fromValue= @0.0;
        growAnimation.toValue=@0.7;
        growAnimation.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *shrinkAnimation;
        shrinkAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        shrinkAnimation.duration=.1;
        shrinkAnimation.beginTime = startingPoint + 0.1f;
        shrinkAnimation.byValue= @0.1;
        shrinkAnimation.fillMode = kCAFillModeForwards;
        shrinkAnimation.autoreverses = YES;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration = shrinkAnimation.duration*2 + growAnimation.duration + startingPoint;
        group.removedOnCompletion = NO;
        group.fillMode = kCAFillModeForwards;
        group.animations = @[opacityAnimation,growAnimation,shrinkAnimation];
        NSUInteger currentBottleIndex = [self.bottlesArray indexOfObject:bottle];
        
        NSString *groupKey = [NSString stringWithFormat:@"animationBottle%lu", currentBottleIndex];
        [CATransaction begin];
//        if (i == self.bottlesArray.count -1) {
//            [CATransaction setCompletionBlock:^{
//                [self animatePercentageOfBottlesDrank:67];
//            }];
//        }
        
        [bottle addAnimation:group forKey:groupKey];
        [CATransaction commit];
        [self.layer addSublayer:bottle];

    }
}

#pragma mark - Private

- (void)animatePercentageOfBottlesDrank:(int)percentageDrank{
    
    int bottlesDrank = percentageDrank/10;
    int partialDrank = percentageDrank%10;
    
    for (int i = 0; i < bottlesDrank; i++) {
        CGFloat startingPoint = (i*0.3);
        CAShapeLayer *bottle = [self.bottlesArray objectAtIndex:i];
        CAShapeLayer *fillingLayer =[[ CAShapeLayer alloc] init];
        CGRect frame = bottle.bounds;
        frame.origin.x = -CGRectGetWidth(frame);
        fillingLayer.frame = frame;
        fillingLayer.backgroundColor = [UIColor orangeColor].CGColor;
        CABasicAnimation *positionAnimation;
        positionAnimation=[CABasicAnimation animationWithKeyPath:@"position.x"];
        positionAnimation.duration=0.3f;
        positionAnimation.beginTime = startingPoint;
        positionAnimation.byValue= @(CGRectGetWidth(frame));
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
        group.animations = @[ positionAnimation];
        group.duration = startingPoint + 0.3f;
        group.fillMode = kCAFillModeForwards;
        group.removedOnCompletion = NO;
        [CATransaction begin];
        if (i == bottlesDrank - 1) {
            [CATransaction setCompletionBlock:^{
                CAShapeLayer *partialBottle = [self.bottlesArray objectAtIndex:bottlesDrank];
                CAShapeLayer *partialFillLayer = [[CAShapeLayer alloc] init];
                
                double percentageComplete = partialDrank/10.0;

                CGRect frame = partialBottle.bounds;
                frame.origin.x = -CGRectGetWidth(frame);
                partialFillLayer.frame = frame;
                partialFillLayer.backgroundColor = [UIColor orangeColor].CGColor;
                
                CABasicAnimation *positionAnimation;
                positionAnimation=[CABasicAnimation animationWithKeyPath:@"position.x"];
                positionAnimation.duration=0.3f*percentageComplete;
                positionAnimation.byValue= @(CGRectGetWidth(frame)*percentageComplete);
                positionAnimation.fillMode = kCAFillModeForwards;
                positionAnimation.removedOnCompletion = NO;
                [partialFillLayer addAnimation:positionAnimation forKey:@"partialFill"];
                [partialBottle addSublayer:partialFillLayer];
                
            }];
        }
        [fillingLayer addAnimation:group forKey:@"fillingBottle"];
        [bottle addSublayer:fillingLayer];
        [CATransaction commit];

    }
    
    
}
@end
