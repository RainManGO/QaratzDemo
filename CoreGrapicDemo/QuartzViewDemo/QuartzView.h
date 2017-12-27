//
//  QuartzView.h
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/14.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzView : UIView

-(void)centerDrawing:(CGContextRef)context drawingExtent:(CGRect)Rect scaleToFit:(BOOL)scale;
-(void)drawInContext:(CGContextRef)ctx;
@end
