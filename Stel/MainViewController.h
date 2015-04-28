//
//  ViewController.h
//  Stel
//
//  Created by Bryan Antigua on 4/24/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completionBlock)(BOOL finished);

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *waterBottleContainerView;
@property (strong, nonatomic) IBOutlet UIView *totalBottlesContainerView;
@property (strong, nonatomic) IBOutlet UIButton *bluetoothButton;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;

@end

