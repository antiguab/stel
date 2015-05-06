//
//  AutoLayoutUtil.h
//  Stel
//
//  Created by Bryan Antigua on 5/4/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AutoLayoutUtil : NSObject

+ (NSMutableArray*)centerAndSizeToSuperViewConstraints:(UIView *)view;
+ (NSMutableArray*)centerWithSuperViewConstraints:(UIView *) view;
+ (NSLayoutConstraint*)centerYWithSuperViewConstraint:(UIView*) view;
+ (NSLayoutConstraint*)centerXWithSuperViewConstraint:(UIView*) view;
+ (NSLayoutConstraint*)widthEqualToSuperViewConstraint:(UIView*) view;
+ (NSLayoutConstraint*)heightEqualToSuperViewConstraint:(UIView*) view;
+ (NSLayoutConstraint*)aspectRatioConstraint:(UIView*) view width:(double)width height:(double)height;
@end
