//
//  LinesQuartzView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/14.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "LinesQuartzView.h"

@implementation LinesQuartzView


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
#pragma mark  画一个直线
    
    //父类方法主要让画布居中缩放适配机型
    [self centerDrawing:ctx drawingExtent:CGRectMake(0, 0, 320, 160) scaleToFit:NO];
    
    //设置画笔的颜色还有很多种方法，这种事最容易理解的
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    //设置线的宽度
    CGContextSetLineWidth(ctx, 2.0);
    
    //移动到一个开始的点
    CGContextMoveToPoint(ctx, 10.0, 30.0);
    
    //添加一段线从出发点到另一个点
    CGContextAddLineToPoint(ctx, 310.0, 30.0);
    
    //开始绘制线段
    CGContextStrokePath(ctx);
    
    
#pragma mark  根据点划线
    //创建一个点的数组
    CGPoint sPoints[10];
    
    //循环设置点
    for (int i=0;i<10;i++) {
        CGFloat x = 30+30*i;
        CGFloat y = i%2==0?90:60;
        sPoints[i] = CGPointMake(x,y);
    }
    
    //设置画笔的颜色还有很多种方法，这种事最容易理解的
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    //线的连接点的样式 有三种具体看枚举
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    //添加点
    CGContextAddLines(ctx, sPoints, 10);

    CGContextStrokePath(ctx);
    
    
#pragma mark  画线段
    CGPoint segementPoints[10] = {
        CGPointMake(10, 150),
        CGPointMake(70, 120),
        CGPointMake(130, 150),
        CGPointMake(190, 120),
        CGPointMake(250, 150),
        CGPointMake(310, 120)
    };
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokeLineSegments(ctx, segementPoints, 6);
}



@end
