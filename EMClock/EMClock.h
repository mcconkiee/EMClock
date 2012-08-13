//
//  EMClock.h
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMClockFace.h"
#import "EMClockHand.h"



@protocol EMClockDelegate <NSObject>

@optional
-(UIColor *)emclock:(id)clock colorForFaceLabel:(UILabel*)label atIndex:(NSInteger)index;
-(UIView *)emclock:(id)clock  clockHandforType:(EMClockHandType)handType;
-(UIColor *)emclock:(id)clock colorForHand:(EMClockHand *)label ; 
@end

@interface EMClock : UIView

@property (nonatomic,retain)UIView *hourHand;
@property (nonatomic,retain)UIView *minuteHand;
@property (nonatomic,retain)UIView *secondHand;
@property (nonatomic,retain)EMClockFace *face;
@property (nonatomic,assign)id<EMClockDelegate>delegate;
@property (nonatomic,assign) int hours;
@property (nonatomic,assign) int minutes;
@property (nonatomic,assign) int seconds;
- (id)initWithFrame:(CGRect)frame delegate:(id<EMClockDelegate>)aDelegate;
-(void)setTime:(NSDate*)time animated:(BOOL)flag;
-(void)setMinutes:(int)mins animated:(BOOL)flag;
-(void)setHours:(int)hours animated:(BOOL)flag;
@end
