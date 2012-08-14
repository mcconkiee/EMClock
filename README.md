EMClock
=======

A drop in analog clock for iOS made from Core Graphics, UIKit, and trig!(yay!).

A few things:

* always create clock instances with `- (id)initWithFrame:(CGRect)frame delegate:` if you plan to customize hand and labels (of the clcok face)
* clock time can be set (and animated) using

`-(void)setTime:(NSDate*)time animated:(BOOL)flag;`

`-(void)setMinutes:(int)mins animated:(BOOL)flag;`

`-(void)setHours:(int)hours animated:(BOOL)flag;`

You are responsible for tracking time! The EMClock is solely a view…the demo has a timer to show one method by which to keep time.

Check out the sample to see some examples of how to implement.

###images
![standar clock](https://img.skitch.com/20120815-xr15srpfbig7yd5b8g5xrdg8nr.png)
![timer clock](https://img.skitch.com/20120815-ccktknye8sw89bxhq87axm4cma.png)

TODO
=========

* allow for custom clock face labels
* tap hands for setting time
* full  customization of colors, hands (images or types), etc (in progress)