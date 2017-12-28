//
//  ImageView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

-(void)drawInContext:(CGContextRef)ctx{
    
    CGRect  imageRect = CGRectMake((SCREEN_WIDTH-self.image.size.width)/2, ((80+0.2*SCREEN_HEIGHT)-self.image.size.height)/2, self.image.size.width, self.image.size.height);
    CGContextDrawImage(ctx, imageRect, self.image.CGImage);
    
    
    CGRect  rect = CGRectInset(CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT), SCREEN_WIDTH*0.2, SCREEN_HEIGHT*0.2);
    CGContextClipToRect(ctx, rect);
    imageRect.origin = CGPointMake(32, 112);
    CGContextDrawTiledImage(ctx, imageRect, self.image.CGImage);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0f);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeRect(ctx, CGContextGetClipBoundingBox(ctx));
}

-(UIImage *)image{
    NSURL *  Path = [[NSBundle mainBundle] URLForResource:@"Demo" withExtension:@"png"];
    UIImage * image = [UIImage imageWithContentsOfFile:Path.path];
    return image;
}

@end
