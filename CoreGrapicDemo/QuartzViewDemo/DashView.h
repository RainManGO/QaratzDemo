//
//  DashView.h
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/19.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzView.h"

@interface DashView : QuartzView
@property(nonatomic,copy)NSArray * dashPettern;
@property(nonatomic,assign)CGFloat  phase;
@end
