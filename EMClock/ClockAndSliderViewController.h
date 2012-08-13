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
@interface ClockAndSliderViewController : UIViewController<EMClockDelegate>
{
    //time to tick and keep time
    //if not using second hands, consider a minute timer
    NSTimer *timer;
    
    //hold ref to this clock
    id clock;

    //a helper to work the date calculations of this demo
    EMDateTimeHelper *_helper;
    
}

//slider simply allows user to slide from midnight to midnight to watch the hands go round...
@property (retain, nonatomic) IBOutlet UISlider *sliderTime;

@end
