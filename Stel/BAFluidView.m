//The MIT License (MIT)
//
//Copyright (c) 2014 Bryan Antigua <antigua.b@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#import "BAFluidView.h"
#import "Util.h"

@interface BAFluidView()
{
    CAShapeLayer *lineLayer;
    int finalX;
    
    NSArray *amplitudeArray;
    int amplitudeIncrement;
    int maxAmplitude;
    int minAmplitude;
    int startingAmplitude;
    NSNumber* startElevation;
    NSNumber* fillLevel;
    int waveLength;//** 2 UIBezierPaths = 1 wavelength
    UIView *rootView;
    CAKeyframeAnimation *waveCrestAnimation;

    

}
@end

@implementation BAFluidView

-  (id)initWithFrame:(CGRect)aRect maxAmplitude:(int)aMaxAmplitude minAmplitude:(int)aMinAmplitude amplitudeIncrement:(int)aAmplitudeIncrement
{
    self = [super initWithFrame:aRect];
        
    if (self)
    {
        [self defaultConfiguration];
        
        //setting custom wave properties
        maxAmplitude = aMaxAmplitude;
        minAmplitude = aMinAmplitude;
        amplitudeIncrement = aAmplitudeIncrement;
        amplitudeArray = [self createAmplitudeOptions];
        [self addAnimations];
    }
    return self;
}

-  (id)initWithFrame:(CGRect)aRect maxAmplitude:(int)aMaxAmplitude minAmplitude:(int)aMinAmplitude amplitudeIncrement:(int)aAmplitudeIncrement startElevation:(NSNumber*)aStartElevation
{
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        [self defaultConfiguration];
        
        //setting custom wave properties
        maxAmplitude = aMaxAmplitude;
        minAmplitude = aMinAmplitude;
        amplitudeIncrement = aAmplitudeIncrement;
        amplitudeArray = [self createAmplitudeOptions];
        startElevation = aStartElevation;
    }
    return self;
}


-  (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        [self defaultConfiguration];
        
    }
    return self;
}

-  (id)initWithFrame:(CGRect)aRect startElevation:(NSNumber*)aStartElevation
{
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        [self defaultConfiguration];
        startElevation = aStartElevation;        
    }
    return self;
}

-( void) defaultConfiguration {
    
    //find root view - the waves look weird if you go only by the size of the container
    rootView = [self.window.subviews objectAtIndex:0];
    // create the wave layer and make it blue
    self.clipsToBounds = YES;
    lineLayer = [CAShapeLayer layer];
    lineLayer.fillColor = [[Util UIColorFromHex:0x6BB9F0] CGColor];
    lineLayer.strokeColor = [[Util UIColorFromHex:0x6BB9F0] CGColor];

    //default wave properties
    self.fillAutoReverse = YES;
    self.fillRepeatCount = HUGE_VALF;
    amplitudeIncrement = 5;
    maxAmplitude = 40;
    minAmplitude = 5;
    startingAmplitude = maxAmplitude;
    waveLength = CGRectGetWidth(rootView.frame);
    startElevation = @0;
    finalX = 2*waveLength;
    
    //available amplitudes
    amplitudeArray = [NSArray arrayWithArray:[self createAmplitudeOptions]];
    
    //creating a linelanyer frame
    lineLayer.anchorPoint= CGPointMake(0, 0);
    CGRect frame = CGRectMake(0, CGRectGetHeight(self.frame), finalX, CGRectGetHeight(rootView.frame));
    lineLayer.frame = frame;
    
    //
    fillLevel = @0.0;
}

- (void) setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    lineLayer.fillColor = [fillColor CGColor];
}

- (void) setStrokeColor:(UIColor *)strokeColor{
    _strokeColor = strokeColor;
    lineLayer.strokeColor = [strokeColor CGColor];
}

- (void) setLineWidth:(float)lineWidth{
    _lineWidth = lineWidth;
    lineLayer.lineWidth = lineWidth;
}

- (void) setFillAutoReverse:(BOOL)fillAutoReverse {
    _fillAutoReverse = fillAutoReverse;
}

- (void) setFillRepeatCount:(float)fillRepeatCount {
    _fillRepeatCount= fillRepeatCount;
}

- (void) startAnimation {
    [self addAnimations];
}

-(void)addAnimations {
    startingAmplitude = maxAmplitude;
    
    //Phase Shift Animation
    CAKeyframeAnimation *horizontalAnimation =
    [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    horizontalAnimation.values = @[@(lineLayer.position.x),@(-finalX + waveLength)];
    horizontalAnimation.additive = true;
    horizontalAnimation.duration = 1.0;
    horizontalAnimation.repeatCount = HUGE;
    horizontalAnimation.calculationMode = @"paced";
    [lineLayer addAnimation:horizontalAnimation forKey:@"horizontalAnimation"];

    //Wave Crest Animations
    waveCrestAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    waveCrestAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    waveCrestAnimation.values = [self getBezierPathValues];
    waveCrestAnimation.duration = 0.5;
    waveCrestAnimation.removedOnCompletion = NO;
    waveCrestAnimation.fillMode = kCAFillModeForwards;
    waveCrestAnimation.delegate = self;
    [self updateWaveSegmentAnimation];

    //fill level
    [self fillTo:fillLevel];

    //add sublayer to view
    [self.layer addSublayer:lineLayer];
}

-(void)keepStationary{
        [lineLayer removeAnimationForKey:@"verticalAnimation"];
}

-(void)fillTo:(NSNumber*)percentage{
    fillLevel = percentage;

    CAKeyframeAnimation *verticalAnimation =
    [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    float finalPosition;
    finalPosition = (1.0 - [percentage doubleValue])*CGRectGetHeight(self.frame);
    
 
    //bit hard to define a hard endpoint with the dynamic waves
    if ([fillLevel  isEqual: @1.0]){
        finalPosition = finalPosition - 2*maxAmplitude;
    }
    else if ([fillLevel doubleValue] > 0.98) {
        finalPosition = finalPosition - maxAmplitude;
    }
    

    [CATransaction begin];
    verticalAnimation.values = @[@(lineLayer.position.y),@(finalPosition)];
    verticalAnimation.duration = 7*[percentage doubleValue];
    verticalAnimation.autoreverses = self.fillAutoReverse;
    verticalAnimation.repeatCount = self.fillRepeatCount;
    verticalAnimation.removedOnCompletion = NO;
    verticalAnimation.fillMode = kCAFillModeForwards;
    [CATransaction setCompletionBlock:^{
        lineLayer.position = CGPointMake(lineLayer.position.x, finalPosition);
    }];
    [lineLayer addAnimation:verticalAnimation forKey:@"verticalAnimation"];
    [CATransaction commit];

}

-(void) updateWaveSegmentAnimation{
    //Wave Crest animation
    [CATransaction begin];
    [lineLayer removeAnimationForKey:@"waveSegmentAnimation"];
    waveCrestAnimation.values = [self getBezierPathValues];
    [CATransaction setCompletionBlock:^{
        [self updateWaveSegmentAnimation];
    }];
    [lineLayer addAnimation:waveCrestAnimation forKey:@"waveSegmentAnimation"];
    [CATransaction commit];
}

- (NSArray*) getBezierPathValues{
    //creating wave starting point
    CGPoint startPoint;
    if (startElevation) {
        startPoint = CGPointMake(CGRectGetMinX(self.frame), ((1 - [startElevation floatValue]/100))*CGRectGetHeight(self.frame));
    }
    else{
        startPoint = CGPointMake(CGRectGetMinX(self.frame), CGRectGetHeight(self.frame));
    }
    
    startPoint = CGPointMake(0, maxAmplitude);
    //grabbing random amplitude to shrink/grow to
    NSNumber *index = [NSNumber numberWithInt:arc4random_uniform(7)];
    
    int finalAmplitude = [[amplitudeArray objectAtIndex:[index intValue]] intValue];
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    //shrinking
    if (startingAmplitude >= finalAmplitude) {
        for (int j = startingAmplitude; j >= finalAmplitude; j-=amplitudeIncrement) {
            //create a UIBezierPath along distance
            UIBezierPath* line = [UIBezierPath bezierPath];
            [line moveToPoint:startPoint];
            int tempAmplitude = j;
            for (int i = waveLength/2; i <= finalX; i+=waveLength/2) {
                [line addQuadCurveToPoint:CGPointMake(startPoint.x + i,startPoint.y) controlPoint:CGPointMake(startPoint.x + i -(waveLength/4),startPoint.y + tempAmplitude)];
                tempAmplitude = -tempAmplitude;
            }
            
            [line addLineToPoint:CGPointMake(finalX, CGRectGetHeight(rootView.frame) - maxAmplitude)];
            [line addLineToPoint:CGPointMake(0, CGRectGetHeight(rootView.frame) - maxAmplitude)];
            [line closePath];
            
            [values addObject:(id)line.CGPath];
        }
        
    }
    
    //growing
    else{
        for (int j = startingAmplitude; j <= finalAmplitude; j+=amplitudeIncrement) {
            //create a UIBezierPath along distance
            UIBezierPath* line = [UIBezierPath bezierPath];
            [line moveToPoint:startPoint];

            int tempAmplitude = j;
            for (int i = waveLength/2; i <= finalX; i+=waveLength/2) {
                [line addQuadCurveToPoint:CGPointMake(startPoint.x + i,startPoint.y) controlPoint:CGPointMake(startPoint.x + i -(waveLength/4),startPoint.y + tempAmplitude)];
                tempAmplitude = -tempAmplitude;
            }
            
            [line addLineToPoint:CGPointMake(finalX, CGRectGetHeight(rootView.frame) - maxAmplitude)];
            [line addLineToPoint:CGPointMake(0, CGRectGetHeight(rootView.frame) - maxAmplitude)];
            [line closePath];
            
            [values addObject:(id)line.CGPath];
        }
        
        
    }
    
    startingAmplitude = finalAmplitude;
    
    return [NSArray arrayWithArray:values];
    
}

- (NSArray*)createAmplitudeOptions{
    NSMutableArray *tempAmplitudeArray = [[NSMutableArray alloc] init];
    for (int i = minAmplitude; i <= maxAmplitude; i+= amplitudeIncrement) {
        [tempAmplitudeArray addObject:[NSNumber numberWithInt:i]];
    }
    return tempAmplitudeArray;
}


@end
