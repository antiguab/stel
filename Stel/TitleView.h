//
//  TitleVIew.h
//  sketctToPaintCode
//
//  Created by Bryan Antigua on 3/2/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completionBlock)(BOOL finished);

@interface TitleView : UIView

- (void)animateTitle:(completionBlock)compblock;

@end
