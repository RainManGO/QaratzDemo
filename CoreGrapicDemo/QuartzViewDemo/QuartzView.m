//
//  QuartzView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/14.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzView.h"
#import "Config.h"
@implementation QuartzView

//父类方法主要让画布居中缩放适配机型

-(void)centerDrawing:(CGContextRef)context drawingExtent:(CGRect)Rect scaleToFit:(BOOL)scale{

    CGFloat xScale = SCREEN_WIDTH/Rect.size.width;
    CGFloat yScale = SCREEN_HEIGHT/Rect.size.height;
    CGFloat doScale = scale?MIN(xScale, yScale):1.0;
    CGFloat xExtra = SCREEN_WIDTH - Rect.size.width * doScale;
    CGFloat yExtra = SCREEN_HEIGHT - Rect.size.height *doScale;
    CGContextTranslateCTM(context, xExtra/2, yExtra/2);
    CGContextScaleCTM(context, doScale, doScale);
    
}

//不重写drawRect drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;不调用

-(void)drawRect:(CGRect)rect{
}
@end
