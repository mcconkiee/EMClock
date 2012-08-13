//
//  EMClockDelegate.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMDateTimeHelper.h"

@implementation EMDateTimeHelper
@synthesize midNight = _midNight;

- (id)init
{
    self = [super init];
    if (self) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *now = [NSDate date];
        NSDateComponents *mNightComponents = [calendar
                                              components:NSIntegerMax
                                              fromDate:now];
        [mNightComponents setHour:0];
        [mNightComponents setMinute:0];
        [mNightComponents setSecond:0];
        
        
        
        _midNight = [[calendar dateFromComponents:mNightComponents] retain];
    }
    return self;
}

-(NSTimeInterval)secondsPassedSinceMidnight
{
    NSDate *now = [NSDate date];
    NSTimeInterval nowInt = [now timeIntervalSinceDate:_midNight];
    return nowInt;
}

-(NSDate *)dateFromMidnightWithTimeInterval:(NSInteger)val
{
    NSTimeInterval intv = (int)val;
    NSDate *dateFromInterval = [NSDate dateWithTimeInterval:intv sinceDate:_midNight];

    return dateFromInterval;
}
@end
