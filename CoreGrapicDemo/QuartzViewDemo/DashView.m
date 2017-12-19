//
//  DashView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/19.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "DashView.h"

@implementation DashView

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self centerDrawing:ctx drawingExtent:CGRectMake(0, 0, 320, 140) scaleToFit:NO];
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    size_t n = [self.dashPettern count];
    CGFloat dashPattern[n];
    for (int i=0; i<n; i++) {
        dashPattern[i] = [self.dashPettern[i] floatValue];
    }
    
    CGContextSetLineDash(ctx, self.phase,dashPattern,n);
    CGContextMoveToPoint(ctx, 10, 30);
    CGContextAddLineToPoint(ctx, 310, 20);
    CGContextMoveToPoint(ctx, 160, 30);
    CGContextAddLineToPoint(ctx, 160, 30);
    CGContextAddRect(ctx, CGRectMake(10, 30, 100, 100));
    CGContextAddEllipseInRect(ctx, CGRectMake(210, 30, 100, 100));
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextStrokePath(ctx);
}

@end
