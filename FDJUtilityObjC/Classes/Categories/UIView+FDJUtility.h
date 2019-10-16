//
//  UIView+FDJUtility.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/10/16.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FDJUtility)

- (UIView *)findView:(BOOL(^)(UIView * subView))filter;

@end

NS_ASSUME_NONNULL_END
