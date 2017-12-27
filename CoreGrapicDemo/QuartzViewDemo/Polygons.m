//
//  Polygons.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/19.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "Polygons.h"

@implementation Polygons

-(void)drawInContext:(CGContextRef)ctx{
  
    [self centerDrawing:ctx drawingExtent:CGRectMake(0, 0, 280, 280) scaleToFit:NO];
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0);
    CGPoint center = CGPointMake(90, 90);
    CGContextMoveToPoint(ctx, center.x, center.y+60.0);
    for (float i=1; i<6; i++) {
        CGFloat x = 60 * sinf(i*4.0*M_PI/5.0);
        CGFloat y = 60 * cosf(i*4.0*M_PI/5.0);
        CGContextAddLineToPoint(ctx, center.x+x, center.y+y);
    }
    
    
    CGPoint center1 = CGPointMake(210, 90);
    CGContextMoveToPoint(ctx, center1.x, center1.y+60.0);
    for (float i=1; i<6; i++) {
        CGFloat x = 60 * sinf(i*2.0*M_PI/5.0);
        CGFloat y = 60 * cosf(i*2.0*M_PI/5.0);
        CGContextAddLineToPoint(ctx, center1.x+x, center1.y+y);
    }
    
    CGContextDrawPath(ctx, _mode);
}

@end
