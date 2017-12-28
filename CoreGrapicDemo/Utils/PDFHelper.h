//
//  PDFHelper.h
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface PDFHelper : NSObject
+(instancetype)shareManger;
-(CGPDFDocumentRef)pdf;
-(int)getPDFPage;
@end
