//
//  FDJViewController.m
//  FDJUtilityObjC
//
//  Created by likethephoenix@163.com on 09/12/2019.
//  Copyright (c) 2019 likethephoenix@163.com. All rights reserved.
//

#import "FDJViewController.h"
#import <FDJUtilityObjC/FDJUtility.h>
#import <FDJUtilityObjC/FDJCategories.h>

@interface FDJViewController ()

@end

@implementation FDJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray * arr1 = @[@"1",@"2",@"5",@"6",@"7",@"8",@"9",@"10"];
    NSArray * arr2 = @[@"2",@"3",@"4",@"6",@"8",@"10"];
    
    NSArray * result = [arr1 repetitiveElements:arr2 primaryKey:nil];
    
    if ([DeviceUtility bangDevice]) {
        NSLog(@"此设备是刘海屏幕");
    }else {
        NSLog(@"此设备不是刘海屏幕");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
