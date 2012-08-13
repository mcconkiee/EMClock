EMClock
=======

A drop in analog clock for iOS made from Core Graphics, UIKit, and trig!(yay!).

A few things:

* always create clock instances with `- (id)initWithFrame:(CGRect)frame delegate:` if you plan to customize hand and labels (of the clcok face)
* clock time can be set (and animated) using

`-(void)setTime:(NSDate*)time animated:(BOOL)flag;`

`-(void)setMinutes:(int)mins animated:(BOOL)flag;`

`-(void)setHours:(int)hours animated:(BOOL)flag;`


TODO
=========

* allow for custom clock face labels
* allow for multiple clock hands (could be useful to show things like next 5 train arrivals in the hour)
* full  customization of colors, hands (images or types), etc