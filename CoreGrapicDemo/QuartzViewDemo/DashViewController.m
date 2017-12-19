//
//  DashViewController.m
//  CoreGrapicDemo
//
//  Created by apple on 2017/12/19.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "DashViewController.h"
#import "DashView.h"
@interface DashViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet DashView *dsahView;
@property(nonatomic ,copy)NSArray *  patterns;
@end

@implementation DashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _patterns = @[@[@"10", @"10"],@[@"10", @"20", @"10"],
                  @[@"10", @"20", @"30"],@[@"10", @"20", @"10", @"30"],
                  @[@"10", @"10", @"20", @"20"],@[@"10", @"10", @"20", @"30",@"50"]];
    self.dsahView.dashPettern = _patterns[0];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _patterns.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString  * title = [_patterns[row] componentsJoinedByString:@"-"];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.dsahView.dashPettern = _patterns[row];
    [self.dsahView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeDashPhase:(UISlider *)sender {
    self.dsahView.phase = sender.value;
    [self.dsahView setNeedsDisplay];
}

@end
