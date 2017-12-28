//
//  QuartzPDFView.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "QuartzPDFView.h"
#import "PDFHelper.h"

@implementation QuartzPDFView

-(void)drawInContext:(CGContextRef)ctx{
    CGContextTranslateCTM(ctx, 0, SCREEN_HEIGHT-20);
    CGContextScaleCTM(ctx, 0.4, -0.4);
    CGPDFPageRef page;
    page = CGPDFDocumentGetPage(self.pdf, self.page);
    CGContextDrawPDFPage(ctx, page);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddRect(ctx, CGRectMake(200, 500, 300, 300));
    CGContextFillPath(ctx);
}

-(CGPDFDocumentRef)pdf{
    return [[PDFHelper shareManger] pdf];
}

@end
