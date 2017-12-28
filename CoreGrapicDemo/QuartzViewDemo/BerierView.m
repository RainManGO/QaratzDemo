//
//  BerierView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "BerierView.h"

@implementation Ball

@end

@implementation Rope

@end

@implementation BerierView
{
    Ball  *  _ball;
    Rope  *  _rope;
    CADisplayLink * _displayLink;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
   self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupBall];
        [self setupRope];
        [self setupTimer];
    }
    
    return self;
}

-(void)setupBall{
    _ball = [[Ball alloc]init];
    _ball.accelerated = 30;
    _ball.speed       = 0;
    _ball.size        = CGSizeMake(30, 30);
    _ball.postion     = CGPointMake(195, 100);
}

-(void)setupRope{
    _rope = [[Rope alloc]init];
    _rope.x = 0;
    _rope.k = 20;
    _rope.start    = CGPointMake(150, 420);
    _rope.end      = CGPointMake(270, 420);
    _rope.position = CGPointMake(200,420);
    _rope.control = CGPointMake(210, 420); //绳子的控制点
}

-(void)setupTimer{
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeClick:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)timeClick:(CADisplayLink *)displayLink{
    
    CGRect ballRect = CGRectMake(_ball.postion.x, _ball.postion.y+1, _ball.size.width, _ball.size.height);

    BOOL ropeMove = NO;
    
    if (CGRectContainsPoint(ballRect,_rope.position)) {
        ropeMove = YES;
        _rope.x = _rope.position.y - _rope.start.y;
    }else{
        _rope.x=0;
    }
    
    _ball.speed += (_ball.accelerated - _rope.k * _rope.x) * displayLink.duration;
    float s = _ball.speed * displayLink.duration;
    _ball.postion = CGPointMake(_ball.postion.x, _ball.postion.y + s);
    
    if (ropeMove==YES) {
        
        float x = _ball.postion.x + _ball.size.width/2;
        float y = _ball.postion.y + _ball.size.height;
        
        // 中间点 公式的t为0.5
        float t = 0.5;
        
        // 根据公式逆推出控制点
        float cx = (x - (1-t)*(1-t)*_rope.start.x - t*t*_rope.end.x)/(2*t*(1-t));
        float cy = (y - (1-t)*(1-t)*_rope.start.y - t*t*_rope.end.y)/(2*t*(1-t));
        
        _rope.position = CGPointMake(x, y);
        _rope.control = CGPointMake(cx, cy);
        
        // fix 小球未与绳子接触，小球的位置高于绳子的位置
        if (y <= _rope.end.y) {
            _rope.position = CGPointMake((_rope.end.x+_rope.start.x)/2, _rope.start.y);
            _rope.control = _rope.position;
        }
        
    }
    
    //fix position
    if (_ball.postion.y < 100) {
        _ball.postion = CGPointMake(_ball.postion.x, 100);
    }

    [self setNeedsDisplay];
}


-(void)drawInContext:(CGContextRef)ctx{
    
//    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
//    CGRect ballRect = CGRectMake(_ball.postion.x, _ball.postion.y, _ball.size.width, _ball.size.height);
//    CGContextAddEllipseInRect(ctx, ballRect);
//    CGContextFillPath(ctx);
    
    
    // 画两个固定点
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddPath(path, NULL, [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_rope.start.x-_ball.size.width/2, _rope.start.y-_ball.size.height/2, _ball.size.width,  _ball.size.height)].CGPath);
    CGPathAddPath(path, NULL, [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_rope.end.x-_ball.size.width/2, _rope.end.y-_ball.size.height/2, _ball.size.width, _ball.size.height)].CGPath);
    CGRect ballRect = CGRectMake(_ball.postion.x, _ball.postion.y, _ball.size.width, _ball.size.height);
    CGPathAddPath(path, NULL, [UIBezierPath bezierPathWithOvalInRect:ballRect].CGPath);
    
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGPathRelease(path);
    
    // 画绳子的贝塞尔曲线
    CGContextMoveToPoint(ctx, _rope.start.x, _rope.start.y);
    CGContextAddQuadCurveToPoint(ctx, _rope.control.x, _rope.control.y, _rope.end.x, _rope.end.y);
    
    // 画最高点标记线
    CGContextMoveToPoint(ctx, _ball.postion.x-30, 100);
    CGContextAddLineToPoint(ctx, _ball.postion.x +50, 100);
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
}
@end
