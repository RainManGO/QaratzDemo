//
//  QuartzCapJointWidthViews.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/18.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzCapJointWidthViews.h"

@implementation QuartzCapJointWidthViews
{
    CGLineCap   cap;
    CGLineJoin  join;
}
//获取宽度，默认值为1
-(CGFloat)width{
    _width=_width==0?1:_width;
    return _width;
}

-(void)drawRect:(CGRect)rect{
    [self reDrawWidth];
}

/**
 *  重绘(刷帧)
 */
- (void)reDrawWidth
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 60, 250);
    CGContextAddLineToPoint(ctx, 180, 160);
    CGContextAddLineToPoint(ctx, 300, 250);
    CGContextSetLineWidth(ctx, self.width);
    CGContextSetLineJoin(ctx, join);
    CGContextSetLineCap(ctx, cap);
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    
    CGContextSaveGState(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(ctx, 60, 150);
    CGContextAddLineToPoint(ctx, 300, 150);
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);

    
}

- (IBAction)capValueChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            cap = kCGLineCapButt;
            break;
        case 1:
            cap = kCGLineCapRound;
            break;
        case 2:
            cap = kCGLineCapSquare;
            break;
        default:
            break;
    }
    [self setNeedsDisplay];

}

- (IBAction)jointValueChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            join = kCGLineJoinMiter;
            break;
        case 1:
            join = kCGLineJoinRound;
            break;
        case 2:
            join = kCGLineJoinBevel;
            break;
        default:
            break;
    }
    [self setNeedsDisplay];

}

- (IBAction)widthChange:(UISlider *)sender {
    self.width = sender.value;
    [self setNeedsDisplay];
}

@end
