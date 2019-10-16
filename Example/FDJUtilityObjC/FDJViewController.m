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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImageView * shadowView = [self.tabBarController.tabBar findView:^BOOL(UIView * _Nonnull subView) {
            if ([subView isKindOfClass:[UIImageView class]] && subView.frame.size.height <= 1) {
                return YES;
            }else {
                return NO;
            }
        }];
        
        shadowView.image = [UIImage new];
        shadowView.backgroundColor = [UIColor clearColor];
    });
    
    
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
