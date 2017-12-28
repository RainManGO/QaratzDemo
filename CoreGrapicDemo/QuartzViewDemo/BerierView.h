//
//  BerierView.h
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzView.h"

@interface Ball : NSObject

@property(nonatomic,assign)float speed;
@property(nonatomic,assign)float accelerated;
@property(nonatomic,assign)CGPoint postion;
@property(nonatomic,assign)CGSize size;

@end

@interface Rope : NSObject

@property (nonatomic, assign) float k;
@property (nonatomic, assign) float x;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGPoint control;
@property (nonatomic, assign) CGPoint start;
@property (nonatomic, assign) CGPoint end;

@end

@interface BerierView : QuartzView

@end
