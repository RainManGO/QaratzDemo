//
//  PDFHelper.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PDFHelper.h"

@implementation PDFHelper


+(instancetype)shareManger{
    
    static PDFHelper * helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper =  [[PDFHelper alloc]init];
    });
    
    return helper;
}

-(CGPDFDocumentRef)pdf{
    
    NSURL * url  =  [[NSBundle mainBundle]URLForResource:@"avfoundation" withExtension:@"pdf"];
    CFURLRef cfurl = (CFURLRef)CFBridgingRetain(url);
    return CGPDFDocumentCreateWithURL(cfurl);
}

-(int)getPDFPage{
    
    size_t n = CGPDFDocumentGetNumberOfPages(self.pdf);
    return (int)n;
}

@end
