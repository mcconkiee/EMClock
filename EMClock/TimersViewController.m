//
//  EMViewController.m
//  EMMultiMinuteClock
//
//  Created by Eric McConkie on 8/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimersViewController.h"

@interface TimersViewController ()

@end

@implementation TimersViewController
-(void)onTick:(NSTimer*)timer
{
//    NSDate *date = [NSDate date];
//    NSDateComponents *nowComps = [[NSCalendar currentCalendar] components:(NSMinuteCalendarUnit) fromDate:date];
    
    for (EMClock *cl in _clocks) {
        int mins = cl.minutes;
        mins -=1;
        if (mins<=0)
            mins = 0;
        
        [cl setMinutes:mins animated:YES];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
	_clocks = [[NSMutableArray alloc] init];
    int times[4] = {2,6,12,27};

    for (int b = 0; b< 4; b++) {
        int curtime = times[b];
        
        EMClock *clck = [[EMClock alloc] initWithFrame:CGRectMake(0, 0, 200, 200) delegate:self];
        [clck setTag:b];
        [[clck hourHand]setHidden:YES];
        [[clck secondHand]setHidden:YES];
        [clck setMinutes:curtime animated:YES];
        [_clocks addObject:clck];
        [self.view addSubview:clck];
        [clck setCenter:self.view.center];
        [clck release];
    }
    _aTimer = [NSTimer scheduledTimerWithTimeInterval:60 //every minute, fire
                                               target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark ---------------------------------->> 
#pragma mark -------------->>clock delegates
-(UIColor*)emclock:(id)clock colorForHand:(EMClockHand *)label
{
    NSInteger tag = [clock tag];
    switch (tag) {
        case 0:
            return [UIColor redColor];
            break;
            
        case 1:
            return [UIColor blueColor];
            break;
            
        case 2:
            return [UIColor yellowColor];
            break;
            
        default:
            return [UIColor blackColor];
            break;
    }
    return [UIColor blackColor];
}

@end
