//
//  EMClockFace.m
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMClockFace.h"
#import "EMClock.h"
#define  kTwelve    12
@implementation EMClockFace
@synthesize clock = _clock;

-(void)face
{
    
    
    int twelve = kTwelve;
    float circle = M_PI *2;
    float increments = circle/twelve;
    CGFloat w = self.bounds.size.width;
    CGPoint halfWay = self.center;
    //at every increment, add the label
    for (int b = twelve; b>0; b--) {
        NSString *timestring = [NSString stringWithFormat:@"%d",b];
        UIFont *ft = [UIFont systemFontOfSize:kTwelve];
        CGSize timestringSize = [timestring sizeWithFont:ft];
        
        float angle = (increments * b) - M_PI_2;//12oclock = -(pi/2)
        float labelHeight = timestringSize.height;
        CGPoint center = self.center;
        float x = center.x + cosf(angle)* (w/2+labelHeight+5);
        float y = center.y + sinf(angle)* (w/2+labelHeight+5);
        
        
        //adjust the x
        float hereX = x;        
        if (x<halfWay.x) {
            hereX = x- timestringSize.width;
        }
        if (b==kTwelve || b == kTwelve/2) {
            hereX = x-timestringSize.width/2;
        }
        
        //adjust the y
        float hereY = y;
        if (y<halfWay.y) {
            hereY = y - timestringSize.height;
        }
        if (b==9 || b == 3) {
            hereY = y-timestringSize.height/2;
        }
        //add the label
        UILabel *lbl = [_labels objectAtIndex:b];
        [lbl setFrame:CGRectMake(hereX, hereY, timestringSize.width,timestringSize.height)];
        [lbl setFont:ft];
        
        UIColor *textColor = [UIColor whiteColor];                        
        
        if ([_clock.delegate respondsToSelector:@selector(emclock:colorForFaceLabel:atIndex:)]) 
            textColor = [_clock.delegate emclock:_clock colorForFaceLabel:lbl atIndex:b];
        
        [lbl setTextColor:textColor];        
        [lbl setText:timestring];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _labels = [[NSMutableArray alloc] init];
        for (int b = kTwelve; b>=0; b--) {
            //add the label
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectZero];  
            [_labels addObject:lbl];
            [lbl setTextAlignment:UITextAlignmentCenter];
            [lbl setBackgroundColor:[UIColor clearColor]];            
            [self addSubview:lbl]; 
            [lbl release];
            
        }
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [self face];
}

- (void)dealloc
{
    _clock = nil;
    [_labels release];
    [super dealloc];
}
@end
