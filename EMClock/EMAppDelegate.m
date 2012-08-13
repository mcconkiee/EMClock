//
//  EMAppDelegate.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMAppDelegate.h"

#import "ClockAndSliderViewController.h"
#import "TimersViewController.h"

@implementation EMAppDelegate

@synthesize window = _window;


- (void)dealloc
{
    [_window release];

    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    ClockAndSliderViewController *normalClock = [[[ClockAndSliderViewController alloc] initWithNibName:@"ClockAndSliderViewController" bundle:nil] autorelease];
    [normalClock setTitle:@"Clock"];
    TimersViewController *timersvc = [[TimersViewController alloc] init];
    [timersvc setTitle:@"Timers"];
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    [tabbar setViewControllers:[NSArray arrayWithObjects:
                                normalClock,
                                timersvc,
                                nil]];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
