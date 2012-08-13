//
//  EMViewController.h
//  EMMultiMinuteClock
//
//  Created by Eric McConkie on 8/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMClock.h"
@interface TimersViewController : UIViewController<EMClockDelegate>
{
    NSTimer *_aTimer;
    NSMutableArray *_clocks;
    
}
@end
