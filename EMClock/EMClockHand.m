//
//  EMClockHand.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMClockHand.h"
#import "EMClock.h"
@implementation EMClockHand
@synthesize clock = _clock;
- (id)initWithFrame:(CGRect)frame handType:(EMClockHandType)clockHandType
{
    self = [super initWithFrame:frame];
    if (self) {

        _handType = clockHandType;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIColor *handColor = [UIColor blackColor];//default
    if ([_clock.delegate respondsToSelector:@selector(emclock:colorForHand:)]) {
        UIColor *result = [_clock.delegate emclock:_clock colorForHand:self];
        if (result!=nil)
            handColor = result;
       
    }
    
    CGFloat handEnd = 5.0;
    CGFloat radius = self.bounds.size.width/2;
    CGPoint c = self.center;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    {
        CGContextSetStrokeColorWithColor(ctx, handColor.CGColor);
        CGContextSetFillColorWithColor(ctx, handColor.CGColor);
        CGContextSetLineWidth(ctx, 2.0);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, c.x,c.y);
        switch (_handType) {
            case EMClockHandTypeHour:
                CGContextAddArc(ctx, c.x +(radius/2-handEnd/2), c.y, handEnd, 0, M_PI *2, 1);
                CGContextFillPath(ctx);
                CGContextMoveToPoint(ctx, c.x, c.y);
                CGContextAddLineToPoint(ctx, c.x + radius/2, c.y);
                break;
            case EMClockHandTypeMinute:
            {   
                CGContextAddArc(ctx, c.x +(radius-handEnd/2)-5, c.y, handEnd, 0, M_PI *2, 1);
                CGContextFillPath(ctx);
                CGContextMoveToPoint(ctx, c.x, c.y);
                CGContextAddLineToPoint(ctx, c.x + radius-5, c.y);                
                
            }
                break;
                
            case EMClockHandTypeSecond:
            {
                CGContextAddLineToPoint(ctx, c.x + radius-5, c.y); 
            }
                break;
                
            default:
                break;
        }
        
        CGContextStrokePath(ctx);
    }
    CGContextRestoreGState(ctx);
    
}

- (void)dealloc
{
    _clock = nil;
    [super dealloc];
}
@end
