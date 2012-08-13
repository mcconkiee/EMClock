//
//  EMClockDelegate.h
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMDateTimeHelper : NSObject
//tracking time
@property (nonatomic,retain) NSDate *midNight;

-(NSTimeInterval)secondsPassedSinceMidnight;
-(NSDate *)dateFromMidnightWithTimeInterval:(NSInteger)val;
@end
