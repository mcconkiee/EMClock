//
//  EMClockFace.h
//  EMClock
//
//  Created by Eric McConkie on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EMClock;
@interface EMClockFace : UIView
{
    NSMutableArray *_labels;
}
@property (nonatomic,assign)EMClock *clock;
@end
