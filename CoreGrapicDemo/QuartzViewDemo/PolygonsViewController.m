//
//  PolygonsViewController.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PolygonsViewController.h"
#import "Polygons.h"
@interface PolygonsViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet Polygons *polygonView;

@end

@implementation PolygonsViewController
{
    NSArray *  _DrawingModeArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _DrawingModeArray = @[ @"Fill",         //0
                           @"EOFill",       //1
                           @"Stroke",       //2
                           @"FillStroke",   //3
                           @"EOFillStroke"  //4
                        ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _DrawingModeArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _DrawingModeArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _polygonView.mode = (int)row;
    [_polygonView setNeedsDisplay];
}

@end
