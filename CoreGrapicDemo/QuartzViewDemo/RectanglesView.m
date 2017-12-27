//
//  RectanglesView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/19.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "RectanglesView.h"

@implementation RectanglesView

-(void)drawInContext:(CGContextRef)ctx{
    
    [self centerDrawing:ctx drawingExtent:CGRectMake(0.0, 0.0, 280.0, 280.0) scaleToFit:NO];
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0);
    
    CGContextAddRect(ctx, CGRectMake(30, 30, 60, 60));
    CGContextStrokePath(ctx);
    
    CGContextStrokeRect(ctx, CGRectMake(30, 120, 60, 60));
    
    CGContextStrokeRectWithWidth(ctx, CGRectMake(30, 120, 60, 60), 10.0);
    
    CGContextSaveGState(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(30, 120, 60, 60), 2.0);
    CGContextRestoreGState(ctx);
    
    
    CGRect rect[] = {
        CGRectMake(120,30, 60, 60),
        CGRectMake(120,120, 60, 60),
        CGRectMake(120,210, 60, 60)
    };
    
    CGContextAddRects(ctx, rect, 3);
    CGContextStrokePath(ctx);
    
    
    CGContextAddRect(ctx, CGRectMake(210, 30, 60, 60));
    CGContextFillPath(ctx);
    
    CGContextFillRect(ctx, CGRectMake(210, 120, 60, 60));
    
}

@end
