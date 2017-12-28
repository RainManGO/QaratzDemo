//
//  QuartzPDFView.h
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzView.h"

@interface QuartzPDFView : QuartzView
@property(nonatomic,assign)CGPDFDocumentRef pdf;
@property(nonatomic,assign)int  page;
@end
