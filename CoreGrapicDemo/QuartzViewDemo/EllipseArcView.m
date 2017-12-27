//
//  EllipseArcView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "EllipseArcView.h"

@implementation EllipseArcView

-(void)drawInContext:(CGContextRef)ctx{
    
    [self centerDrawing:ctx drawingExtent:CGRectMake(0, 0, 280, 280) scaleToFit:NO];
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0f);
    CGContextAddEllipseInRect(ctx, CGRectMake(30, 30, 60, 80));
    CGContextStrokePath(ctx);
    
    CGContextStrokeEllipseInRect(ctx, CGRectMake(30, 120, 60, 60));
    
    CGContextFillEllipseInRect(ctx, CGRectMake(30, 210, 60, 60));
    
    CGContextAddArc(ctx, 150, 60, 30, 0, M_PI_2, 0);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 150, 130, 30, M_PI_2, M_PI, 0);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 150, 210, 30, 0, M_PI_2, 1);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 150, 280, 30, M_PI_2, M_PI, 1);
    CGContextStrokePath(ctx);
    
    
    CGContextAddArc(ctx, 210, 60, 30, 0, M_PI_2, 0);
    CGContextStrokePath(ctx);
    CGContextAddArc(ctx, 210, 60, 30, 3.0*M_PI_2, M_PI, 1);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 210, 130, 30, 0, M_PI_2, 0);
    CGContextAddArc(ctx, 210, 130, 30, 3.0*M_PI_2, M_PI, 1);
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 210, 210, 30, 0, M_PI_2, 0);
    CGContextAddArc(ctx, 210, 210, 30, 3.0*M_PI_2, M_PI, 0);
    CGContextStrokePath(ctx);
    
    CGPoint  lineArcPoints[] = {
        CGPointMake(270, 30),
        CGPointMake(270, 60),
        CGPointMake(300, 60),
    };
    
    CGContextMoveToPoint(ctx, 270, 30);
    CGContextAddArcToPoint(ctx, 270, 60, 300, 60, 30);
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddLines(ctx, lineArcPoints, 3);
    CGContextStrokePath(ctx);
    
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);

    
    CGRect  rect  = CGRectMake(250, 130, 60, 60);
    CGFloat radius = 10.0f;
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat midx = CGRectGetMidX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat midy = CGRectGetMidY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
//  NSLog(@"%f,%f,%f-----%f,%f,%f",minx,midx,maxx,miny,midy,maxy);
//  270.000000,300.000000,330.000000-----130.000000,160.000000,190.000000
    
    CGContextMoveToPoint(ctx, minx, midy);
    CGContextAddArcToPoint(ctx, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, radius);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx,kCGPathFillStroke);

}

@end
