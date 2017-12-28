//
//  PageViewController.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PageViewController.h"
#import "PDFHelper.h"

@interface PageViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@end

@implementation PageViewController
{
    int currnetPage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    currnetPage = 1;
    // Do any additional setup after loading the view.
    
    [self setDelegate:self];
    [self setDataSource:self];
    
    NSArray *viewControllers = [NSArray arrayWithObject:self.pdfController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


-(PDFViewController *)pdfController{
    _pdfController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PDFController"];
    [_pdfController updateWithPage:currnetPage];
    return _pdfController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    currnetPage++;    // get the index of the current view controller on display
    // check if we are at the end and decide if we need to present the next viewcontroller
    if ( currnetPage <= [[PDFHelper shareManger]getPDFPage]) {
        return self.pdfController;                   // return the next view controller
    } else {
        return nil;                                                         // do nothing
    }
}


- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (currnetPage>1) {
        currnetPage--;
        return self.pdfController;                   // return the previous viewcontroller
    }else{
        return nil;                                                         // do nothing
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
