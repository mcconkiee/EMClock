//
//  EMClock.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMClock.h"

@implementation EMClock
@synthesize face;
@synthesize hourHand;
@synthesize minuteHand;
@synthesize secondHand;
@synthesize delegate = _delegate;

- (void)dealloc
{
    [hourHand release];
    [minuteHand release];
    [face release];
    _delegate = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame delegate:(id<EMClockDelegate>)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setDelegate:aDelegate];
        face = [[EMClockFace alloc] initWithFrame:self.bounds];
        [face setClock:self];
        
        hourHand = [[EMClockHand alloc] initWithFrame:self.bounds handType:EMClockHandTypeHour];
        [hourHand setClock:self];
        
        minuteHand = [[EMClockHand alloc] initWithFrame:self.bounds handType:EMClockHandTypeMinute];
        [minuteHand setClock:self];
        
        secondHand = [[EMClockHand alloc] initWithFrame:self.bounds handType:EMClockHandTypeSecond];
        [secondHand setClock:self];
        
        [self addSubview:face];
        [self addSubview:hourHand];
        [self addSubview:minuteHand];
        [self addSubview:secondHand];
        [self setTime:[NSDate date] animated:YES];
        
        [self setNeedsDisplay];//call this again since we had to set a  delegate to which MIGHT effect the face/hands
    }
    return self;
}
-(void)setMinutes:(int)mins animated:(BOOL)flag
{
    int modulo = mins%60 ;
    float perc = (float)modulo / 60.0;
    float radian = ((M_PI *2)* perc)  - M_PI_2;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:1.0 animations:^(){
        minuteHand.transform = CGAffineTransformMakeRotation(radian);
    } completion:^(BOOL done){}];
}
-(void)setHours:(int)hours animated:(BOOL)flag
{
    int modulo = hours%12 ;
    float perc = (float)modulo / 12.0;
    float radian = ((M_PI *2)* perc)  - M_PI_2;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:1.0 animations:^(){
        hourHand.transform = CGAffineTransformMakeRotation(radian);
    } completion:^(BOOL done){}];
}
-(void)setTime:(NSDate*)time animated:(BOOL)flag
{

    NSDateComponents *nowComponents = [[NSCalendar currentCalendar] 
                                    components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit
                                    fromDate:time];
    
//    NSDateComponents *midnightComponents = [[NSCalendar currentCalendar] 
//                                       components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit
//                                       fromDate:time];
//    [midnightComponents setHour:0];
//    [midnightComponents setMinute:0];
//    [midnightComponents setSecond:0];
    
    float percentHour = ((float)nowComponents.hour)/12.0;
    float percentMins = ((float)nowComponents.minute) / 60.0;
    float percentSeconds = ((float)nowComponents.second) / 60.0;
    
    //offset  (percent_mins_of_the_clock/ hours_on_the_face)  to get the position between the hour
    percentHour += (percentMins / 12);
    float radianHour = ((M_PI *2)* percentHour) - M_PI_2;
    float radianMin = ((M_PI *2)* percentMins)  - M_PI_2;
    float radianSec = ((M_PI *2)* percentSeconds)  - M_PI_2;
    if (flag) {
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView animateWithDuration:1.0 animations:^(){
            hourHand.transform = CGAffineTransformMakeRotation(radianHour);
            minuteHand.transform = CGAffineTransformMakeRotation(radianMin);
            secondHand.transform = CGAffineTransformMakeRotation(radianSec);
        }];
    }else {
        hourHand.transform = CGAffineTransformMakeRotation(radianHour);
        minuteHand.transform = CGAffineTransformMakeRotation(radianMin);
    }
    
    [self setNeedsDisplay];
}


@end
