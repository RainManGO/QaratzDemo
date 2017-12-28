//
//  PDFViewController.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PDFViewController.h"
#import "QuartzPDFView.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)updateWithPage:(int)Page{
    QuartzPDFView *  view  = (QuartzPDFView *)self.view;
    view.page = Page;
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
