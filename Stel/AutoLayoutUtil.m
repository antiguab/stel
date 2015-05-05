//
//  AutoLayoutUtil.m
//  Stel
//
//  Created by Bryan Antigua on 5/4/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "AutoLayoutUtil.h"

@implementation AutoLayoutUtil

+ (NSMutableArray*)centerAndSizeToSuperViewConstraints:(UIView *)view {
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [constraints addObject:[self widthEqualToSuperViewConstraint:view]];
    [constraints addObject:[self heightEqualToSuperViewConstraint:view]];
    [constraints addObjectsFromArray:[self centerWithSuperViewConstraints:view]];

    return constraints;
}


+ (NSMutableArray*)centerWithSuperViewConstraints:(UIView *) view {
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    [constraints addObject:[self centerYWithSuperViewConstraint:view]];
    [constraints addObject:[self centerXWithSuperViewConstraint:view]];
    
    return constraints;
}

+ (NSLayoutConstraint*)centerYWithSuperViewConstraint:(UIView*)view {
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY
                                             relatedBy:NSLayoutRelationEqual toItem:view.superview
                                             attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
}

+ (NSLayoutConstraint*)centerXWithSuperViewConstraint:(UIView*)view {
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual toItem:view.superview
                                  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
}

+ (NSLayoutConstraint*)widthEqualToSuperViewConstraint:(UIView*)view {
    return [NSLayoutConstraint constraintWithItem:view attribute: NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual toItem:view.superview
                                                                  attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
}

+ (NSLayoutConstraint*)heightEqualToSuperViewConstraint:(UIView*)view {
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual toItem:view.superview
                                                                  attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
}
@end
