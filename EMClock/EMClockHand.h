//
//  EMClockHand.h
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum 
{
    EMClockHandTypeHour,
    EMClockHandTypeMinute,
    EMClockHandTypeSecond
}EMClockHandType;

@class EMClock;
@interface EMClockHand : UIView
{
    EMClockHandType _handType;
}
@property (nonatomic,assign)EMClock *clock;
- (id)initWithFrame:(CGRect)frame handType:(EMClockHandType)clockHandType;
@end
