//
//  EMViewController.h
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMDateTimeHelper.h"
#import "EMClock.h"
@interface EMViewController : UIViewController<EMClockDelegate>
{
    NSTimer *timer;
    id clock;

    EMDateTimeHelper *_helper;
    
}
@property (retain, nonatomic) IBOutlet UISlider *sliderTime;
@end
