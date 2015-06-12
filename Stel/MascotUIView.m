//
//  MascotUIView.m
//  Stel
//
//  Created by Bryan Antigua on 6/12/15.
//  Copyright (c) 2015 Bryan Antigua. All rights reserved.
//

#import "MascotUIView.h"

@interface MascotUIView()

@property(nonatomic,strong) NSNumber *hydrationState;
@property(nonatomic,strong) UIImageView *mascotImageView;
@property(nonatomic,strong) CABasicAnimation *hover;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,strong) NSArray *state6;
@property(nonatomic,strong) NSArray *state5;
@property(nonatomic,strong) NSArray *state4;
@property(nonatomic,strong) NSArray *state3;
@property(nonatomic,strong) NSArray *state2;
@property(nonatomic,strong) NSArray *state1;


@end
@implementation MascotUIView

#pragma mark -  Lifecycle

-(void) configure {
    self.mascotImageView = [[UIImageView alloc] initWithFrame:self.frame];
    self.mascotImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //this has to do with the way we save images - they need to be cropped somewhat
    CGRect adjustedFrame = self.mascotImageView.frame;
    adjustedFrame.origin.y -=140;
    adjustedFrame.origin.x -= 35;
    self.mascotImageView.frame = adjustedFrame;
    
    [self addSubview:self.mascotImageView];
}

#pragma mark - set Hydration Pic and animation

-(void) updateHydrationAnimation {
    
//    probably need the whole class for these
//    int hydrationState = [[STELHydrationManager sharedManager] hydrationState];
//    [self changeHydStatButton:hydrationState];

    self.hydrationState =  @(arc4random() % 5 + 1);
    switch (self.hydrationState.integerValue) {
        case 6: {
            self.mascotImageView.image = [UIImage imageNamed:@"H3x027"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"H3x000"],
                                                     
                                                     [UIImage imageNamed:@"H3x001"],
                                                     
                                                     [UIImage imageNamed:@"H3x002"],
                                                     
                                                     [UIImage imageNamed:@"H3x003"],
                                                     
                                                     [UIImage imageNamed:@"H3x004"],
                                                     
                                                     [UIImage imageNamed:@"H3x005"],
                                                     
                                                     [UIImage imageNamed:@"H3x006"],
                                                     
                                                     [UIImage imageNamed:@"H3x007"],
                                                     
                                                     [UIImage imageNamed:@"H3x008"],
                                                     
                                                     [UIImage imageNamed:@"H3x009"],
                                                     
                                                     [UIImage imageNamed:@"H3x010"],
                                                     
                                                     [UIImage imageNamed:@"H3x011"],
                                                     
                                                     [UIImage imageNamed:@"H3x012"],
                                                     
                                                     [UIImage imageNamed:@"H3x013"],
                                                     
                                                     [UIImage imageNamed:@"H3x014"],
                                                     
                                                     [UIImage imageNamed:@"H3x015"],
                                                     
                                                     [UIImage imageNamed:@"H3x016"],
                                                     
                                                     [UIImage imageNamed:@"H3x017"],
                                                     
                                                     [UIImage imageNamed:@"H3x018"],
                                                     
                                                     [UIImage imageNamed:@"H3x019"],
                                                     
                                                     [UIImage imageNamed:@"H3x020"],
                                                     
                                                     [UIImage imageNamed:@"H3x021"],
                                                     
                                                     [UIImage imageNamed:@"H3x022"],
                                                     
                                                     [UIImage imageNamed:@"H3x023"],
                                                     
                                                     [UIImage imageNamed:@"H3x024"],
                                                     
                                                     [UIImage imageNamed:@"H3x025"],
                                                     
                                                     [UIImage imageNamed:@"H3x026"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"],
                                                     
                                                     [UIImage imageNamed:@"H3x027"]
                                                     
                                                     ];
            self.mascotImageView.animationDuration = 5.2f;
            break;
        }
        
        case 5:{
            self.mascotImageView.image = [UIImage imageNamed:@"H2x024"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x000"],
                                                     
                                                     [UIImage imageNamed:@"H2x001"],
                                                     
                                                     [UIImage imageNamed:@"H2x002"],
                                                     
                                                     [UIImage imageNamed:@"H2x003"],
                                                     
                                                     [UIImage imageNamed:@"H2x004"],
                                                     
                                                     [UIImage imageNamed:@"H2x005"],
                                                     
                                                     [UIImage imageNamed:@"H2x006"],
                                                     
                                                     [UIImage imageNamed:@"H2x007"],
                                                     
                                                     [UIImage imageNamed:@"H2x008"],
                                                     
                                                     [UIImage imageNamed:@"H2x009"],
                                                     
                                                     [UIImage imageNamed:@"H2x010"],
                                                     
                                                     [UIImage imageNamed:@"H2x011"],
                                                     
                                                     [UIImage imageNamed:@"H2x012"],
                                                     
                                                     [UIImage imageNamed:@"H2x013"],
                                                     
                                                     [UIImage imageNamed:@"H2x014"],
                                                     
                                                     [UIImage imageNamed:@"H2x015"],
                                                     
                                                     [UIImage imageNamed:@"H2x016"],
                                                     
                                                     [UIImage imageNamed:@"H2x017"],
                                                     
                                                     [UIImage imageNamed:@"H2x018"],
                                                     
                                                     [UIImage imageNamed:@"H2x019"],
                                                     
                                                     [UIImage imageNamed:@"H2x020"],
                                                     
                                                     [UIImage imageNamed:@"H2x021"],
                                                     
                                                     [UIImage imageNamed:@"H2x022"],
                                                     
                                                     [UIImage imageNamed:@"H2x023"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"],
                                                     
                                                     [UIImage imageNamed:@"H2x024"]
                                                     
                                                     ];
            
            self.mascotImageView.animationDuration = 4.2f;
            break;
        }
        case 4:{
            self.mascotImageView.image = [UIImage imageNamed:@"H1x016"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x000"],
                                                     
                                                     [UIImage imageNamed:@"H1x001"],
                                                     
                                                     [UIImage imageNamed:@"H1x002"],
                                                     
                                                     [UIImage imageNamed:@"H1x003"],
                                                     
                                                     [UIImage imageNamed:@"H1x004"],
                                                     
                                                     [UIImage imageNamed:@"H1x005"],
                                                     
                                                     [UIImage imageNamed:@"H1x006"],
                                                     
                                                     [UIImage imageNamed:@"H1x006"],
                                                     
                                                     [UIImage imageNamed:@"H1x007"],
                                                     
                                                     [UIImage imageNamed:@"H1x008"],
                                                     
                                                     [UIImage imageNamed:@"H1x009"],
                                                     
                                                     [UIImage imageNamed:@"H1x010"],
                                                     
                                                     [UIImage imageNamed:@"H1x011"],
                                                     
                                                     [UIImage imageNamed:@"H1x012"],
                                                     
                                                     [UIImage imageNamed:@"H1x013"],
                                                     
                                                     [UIImage imageNamed:@"H1x014"],
                                                     
                                                     [UIImage imageNamed:@"H1x015"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"],
                                                     
                                                     [UIImage imageNamed:@"H1x016"]
                                                     
                                                     ];
            
            self.mascotImageView.animationDuration = 4.0f;
            break;

        }
            
        case 3:{
            self.mascotImageView.image = [UIImage imageNamed:@"D1x026"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x000"],
                                                     
                                                     [UIImage imageNamed:@"D1x001"],
                                                     
                                                     [UIImage imageNamed:@"D1x002"],
                                                     
                                                     [UIImage imageNamed:@"D1x003"],
                                                     
                                                     [UIImage imageNamed:@"D1x004"],
                                                     
                                                     [UIImage imageNamed:@"D1x005"],
                                                     
                                                     [UIImage imageNamed:@"D1x006"],
                                                     
                                                     [UIImage imageNamed:@"D1x007"],
                                                     
                                                     [UIImage imageNamed:@"D1x008"],
                                                     
                                                     [UIImage imageNamed:@"D1x009"],
                                                     
                                                     [UIImage imageNamed:@"D1x010"],
                                                     
                                                     [UIImage imageNamed:@"D1x011"],
                                                     
                                                     [UIImage imageNamed:@"D1x012"],
                                                     
                                                     [UIImage imageNamed:@"D1x013"],
                                                     
                                                     [UIImage imageNamed:@"D1x014"],
                                                     
                                                     [UIImage imageNamed:@"D1x015"],
                                                     
                                                     [UIImage imageNamed:@"D1x016"],
                                                     
                                                     [UIImage imageNamed:@"D1x017"],
                                                     
                                                     [UIImage imageNamed:@"D1x018"],
                                                     
                                                     [UIImage imageNamed:@"D1x019"],
                                                     
                                                     [UIImage imageNamed:@"D1x020"],
                                                     
                                                     [UIImage imageNamed:@"D1x021"],
                                                     
                                                     [UIImage imageNamed:@"D1x022"],
                                                     
                                                     [UIImage imageNamed:@"D1x023"],
                                                     
                                                     [UIImage imageNamed:@"D1x024"],
                                                     
                                                     [UIImage imageNamed:@"D1x025"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"],
                                                     
                                                     [UIImage imageNamed:@"D1x026"]
                                                     
                                                     ];
            
            self.mascotImageView.animationDuration = 6.0f;
            break;
        }
        case 2: {
            self.mascotImageView.image = [UIImage imageNamed:@"D2x046"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x045"],
                                                     
                                                     [UIImage imageNamed:@"D2x044"],
                                                     
                                                     [UIImage imageNamed:@"D2x043"],
                                                     
                                                     [UIImage imageNamed:@"D2x042"],
                                                     
                                                     [UIImage imageNamed:@"D2x041"],
                                                     
                                                     [UIImage imageNamed:@"D2x040"],
                                                     
                                                     [UIImage imageNamed:@"D2x039"],
                                                     
                                                     [UIImage imageNamed:@"D2x038"],
                                                     
                                                     [UIImage imageNamed:@"D2x037"],
                                                     
                                                     [UIImage imageNamed:@"D2x019"],
                                                     
                                                     [UIImage imageNamed:@"D2x018"],
                                                     
                                                     [UIImage imageNamed:@"D2x017"],
                                                     
                                                     [UIImage imageNamed:@"D2x016"],
                                                     
                                                     [UIImage imageNamed:@"D2x015"],
                                                     
                                                     [UIImage imageNamed:@"D2x014"],
                                                     
                                                     [UIImage imageNamed:@"D2x013"],
                                                     
                                                     [UIImage imageNamed:@"D2x012"],
                                                     
                                                     [UIImage imageNamed:@"D2x011"],
                                                     
                                                     [UIImage imageNamed:@"D2x010"],
                                                     
                                                     [UIImage imageNamed:@"D2x009"],
                                                     
                                                     [UIImage imageNamed:@"D2x008"],
                                                     
                                                     [UIImage imageNamed:@"D2x007"],
                                                     
                                                     [UIImage imageNamed:@"D2x006"],
                                                     
                                                     [UIImage imageNamed:@"D2x005"],
                                                     
                                                     [UIImage imageNamed:@"D2x004"],
                                                     
                                                     [UIImage imageNamed:@"D2x003"],
                                                     
                                                     [UIImage imageNamed:@"D2x002"],
                                                     
                                                     [UIImage imageNamed:@"D2x001"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x000"],
                                                     
                                                     [UIImage imageNamed:@"D2x001"],
                                                     
                                                     [UIImage imageNamed:@"D2x002"],
                                                     
                                                     [UIImage imageNamed:@"D2x003"],
                                                     
                                                     [UIImage imageNamed:@"D2x004"],
                                                     
                                                     [UIImage imageNamed:@"D2x005"],
                                                     
                                                     [UIImage imageNamed:@"D2x006"],
                                                     
                                                     [UIImage imageNamed:@"D2x007"],
                                                     
                                                     [UIImage imageNamed:@"D2x008"],
                                                     
                                                     [UIImage imageNamed:@"D2x009"],
                                                     
                                                     [UIImage imageNamed:@"D2x010"],
                                                     
                                                     [UIImage imageNamed:@"D2x011"],
                                                     
                                                     [UIImage imageNamed:@"D2x012"],
                                                     
                                                     [UIImage imageNamed:@"D2x013"],
                                                     
                                                     [UIImage imageNamed:@"D2x014"],
                                                     
                                                     [UIImage imageNamed:@"D2x015"],
                                                     
                                                     [UIImage imageNamed:@"D2x016"],
                                                     
                                                     [UIImage imageNamed:@"D2x017"],
                                                     
                                                     [UIImage imageNamed:@"D2x018"],
                                                     
                                                     [UIImage imageNamed:@"D2x019"],
                                                     
                                                     [UIImage imageNamed:@"D2x020"],
                                                     
                                                     [UIImage imageNamed:@"D2x021"],
                                                     
                                                     [UIImage imageNamed:@"D2x022"],
                                                     
                                                     [UIImage imageNamed:@"D2x023"],
                                                     
                                                     [UIImage imageNamed:@"D2x024"],
                                                     
                                                     [UIImage imageNamed:@"D2x025"],
                                                     
                                                     [UIImage imageNamed:@"D2x026"],
                                                     
                                                     [UIImage imageNamed:@"D2x027"],
                                                     
                                                     [UIImage imageNamed:@"D2x028"],
                                                     
                                                     [UIImage imageNamed:@"D2x029"],
                                                     
                                                     [UIImage imageNamed:@"D2x030"],
                                                     
                                                     [UIImage imageNamed:@"D2x031"],
                                                     
                                                     [UIImage imageNamed:@"D2x032"],
                                                     
                                                     [UIImage imageNamed:@"D2x033"],
                                                     
                                                     [UIImage imageNamed:@"D2x034"],
                                                     
                                                     [UIImage imageNamed:@"D2x035"],
                                                     
                                                     [UIImage imageNamed:@"D2x036"],
                                                     
                                                     [UIImage imageNamed:@"D2x037"],
                                                     
                                                     [UIImage imageNamed:@"D2x038"],
                                                     
                                                     [UIImage imageNamed:@"D2x039"],
                                                     
                                                     [UIImage imageNamed:@"D2x040"],
                                                     
                                                     [UIImage imageNamed:@"D2x041"],
                                                     
                                                     [UIImage imageNamed:@"D2x042"],
                                                     
                                                     [UIImage imageNamed:@"D2x043"],
                                                     
                                                     [UIImage imageNamed:@"D2x044"],
                                                     
                                                     [UIImage imageNamed:@"D2x045"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"],
                                                     
                                                     [UIImage imageNamed:@"D2x046"]
                                                     
                                                     ];
            
            self.mascotImageView.animationDuration = 9.9f;
            break;
        }
            
        case 1: {
            self.mascotImageView.image = [UIImage imageNamed:@"D3x028"];
            self.mascotImageView.animationImages = @[
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x029"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x000"],
                                                     
                                                     [UIImage imageNamed:@"D3x001"],
                                                     
                                                     [UIImage imageNamed:@"D3x002"],
                                                     
                                                     [UIImage imageNamed:@"D3x003"],
                                                     
                                                     [UIImage imageNamed:@"D3x004"],
                                                     
                                                     [UIImage imageNamed:@"D3x005"],
                                                     
                                                     [UIImage imageNamed:@"D3x006"],
                                                     
                                                     [UIImage imageNamed:@"D3x007"],
                                                     
                                                     [UIImage imageNamed:@"D3x008"],
                                                     
                                                     [UIImage imageNamed:@"D3x009"],
                                                     
                                                     [UIImage imageNamed:@"D3x010"],
                                                     
                                                     [UIImage imageNamed:@"D3x011"],
                                                     
                                                     [UIImage imageNamed:@"D3x012"],
                                                     
                                                     [UIImage imageNamed:@"D3x013"],
                                                     
                                                     [UIImage imageNamed:@"D3x014"],
                                                     
                                                     [UIImage imageNamed:@"D3x015"],
                                                     
                                                     [UIImage imageNamed:@"D3x016"],
                                                     
                                                     [UIImage imageNamed:@"D3x017"],
                                                     
                                                     [UIImage imageNamed:@"D3x018"],
                                                     
                                                     [UIImage imageNamed:@"D3x019"],
                                                     
                                                     [UIImage imageNamed:@"D3x020"],
                                                     
                                                     [UIImage imageNamed:@"D3x021"],
                                                     
                                                     [UIImage imageNamed:@"D3x022"],
                                                     
                                                     [UIImage imageNamed:@"D3x023"],
                                                     
                                                     [UIImage imageNamed:@"D3x024"],
                                                     
                                                     [UIImage imageNamed:@"D3x025"],
                                                     
                                                     [UIImage imageNamed:@"D3x026"],
                                                     
                                                     [UIImage imageNamed:@"D3x027"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x029"],
                                                     
                                                     [UIImage imageNamed:@"D3x030"],
                                                     
                                                     [UIImage imageNamed:@"D3x031"],
                                                     
                                                     [UIImage imageNamed:@"D3x032"],
                                                     
                                                     [UIImage imageNamed:@"D3x033"],
                                                     
                                                     [UIImage imageNamed:@"D3x034"],
                                                     
                                                     [UIImage imageNamed:@"D3x035"],
                                                     
                                                     [UIImage imageNamed:@"D3x036"],
                                                     
                                                     [UIImage imageNamed:@"D3x037"],
                                                     
                                                     [UIImage imageNamed:@"D3x038"],
                                                     
                                                     [UIImage imageNamed:@"D3x039"],
                                                     
                                                     [UIImage imageNamed:@"D3x040"],
                                                     
                                                     [UIImage imageNamed:@"D3x041"],
                                                     
                                                     [UIImage imageNamed:@"D3x042"],
                                                     
                                                     [UIImage imageNamed:@"D3x031"],
                                                     
                                                     [UIImage imageNamed:@"D3x030"],
                                                     
                                                     [UIImage imageNamed:@"D3x030"],
                                                     
                                                     [UIImage imageNamed:@"D3x029"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"],
                                                     
                                                     [UIImage imageNamed:@"D3x028"]
                                                     
                                                     ];
            
            self.mascotImageView.animationDuration = 6.6f;
            break;
        }
        default:
            //error
            break;
    }
    
    self.mascotImageView.animationRepeatCount = 1;
    
    //for testing purposes======
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.mascotImageView.animationDuration
                                                  target:self
                                                selector:@selector(updateHydrationAnimation)
                                                userInfo:nil
                                                 repeats:NO];
    //end testing======
    [self animateFloating];
    [self animateMascotImageView];
}

-(void) animateMascotImageView {
    if(self.mascotImageView.isAnimating) {
        return;
    }
    
    [self.mascotImageView startAnimating];
}

-(void) animateFloating {
    
    if (self.hover) {
        return;
    }
    
    self.hover = [CABasicAnimation animationWithKeyPath:@"position"];
    self.hover.additive = YES;
    self.hover.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.0, 50.0)];
    self.hover.toValue = [NSValue valueWithCGPoint:CGPointMake(0.0, -30.0)];
    self.hover.autoreverses = YES;
    self.hover.duration = 2.2;
    self.hover.repeatCount = INFINITY;
    [self.mascotImageView.layer addAnimation:self.hover forKey:@"myHoverAnimation"];
}

@end
