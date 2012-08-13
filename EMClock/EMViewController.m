//
//  EMViewController.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMViewController.h"

@interface EMViewController ()

@end

@implementation EMViewController
@synthesize sliderTime;

#pragma mark ---------------------------------->> 
#pragma mark -------------->>handlers
-(void)onTick:(NSTimer*)timer
{
    [(EMClock*)clock setTime:[NSDate date] animated:YES];
}

-(void)onTimeSlider:(UISlider*)slider
{
    [timer invalidate];
    timer = nil;

    int sliderVal = (int)[sliderTime value];
    NSDate *dateFromInterval = [_helper dateFromMidnightWithTimeInterval:sliderVal];
    [clock setTime:dateFromInterval animated:YES];
    
}

-(void)onTimeSliderEnd:(UISlider*)slider
{
    [self resetSlider];
    [self onTick:nil];
    timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
}

#pragma mark ---------------------------------->> 
#pragma mark -------------->>privates
-(void)resetSlider
{
    NSTimeInterval nowInt = [_helper secondsPassedSinceMidnight];    
    [sliderTime setValue:nowInt animated:YES];
}

#pragma mark ---------------------------------->> 
#pragma mark -------------->>lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    _helper = [[EMDateTimeHelper alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
    EMClock *aClock = [[EMClock alloc] initWithFrame:CGRectMake(0, 0, 200, 200) delegate:self];
    [aClock setCenter:self.view.center];
    [[self view]addSubview:aClock];
    [aClock release];
    
    clock = [aClock retain];

    //set up slider
    [sliderTime setMinimumValue:0];
    [sliderTime setMaximumValue:86400];    
    [sliderTime addTarget:self action:@selector(onTimeSlider:) forControlEvents:UIControlEventValueChanged];
    [sliderTime addTarget:self action:@selector(onTimeSliderEnd:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self resetSlider];
    
    timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setSliderTime:nil];
    clock = nil;
    _helper = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [sliderTime release];
    [clock release];
    [_helper release];
    
    [super dealloc];
}


#pragma mark ---------------------------------->> 
#pragma mark -------------->>Clock Delegate
-(UIColor*)emclock:(id)clock colorForFaceLabel:(UILabel *)label atIndex:(NSInteger)index
{
    switch (index) {
        case 12:
            return [UIColor redColor];
            break;
            
        default:
            break;
    }
    return [UIColor whiteColor];
}

-(UIColor*)emclock:(EMClock*)aclock colorForHand:(EMClockHand *)hand
{
    if (hand == aclock.minuteHand) {
        return [UIColor whiteColor ];        
    }
    return nil;
}
@end
